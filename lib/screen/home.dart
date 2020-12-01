import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_paging/bloc/movie/movie_bloc.dart';
import 'package:tmdb_paging/bloc/movie/movie_event.dart';
import 'package:tmdb_paging/bloc/movie/movie_state.dart';
import 'package:tmdb_paging/buildconfig/env.dart';
import 'package:tmdb_paging/data/model/movie/movie.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (_) => MovieBloc(),
      child: HomeContainer(),
    );
  }
}

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  void initState() {
    context.read<MovieBloc>().add(MovieLoadMovieListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MovieBloc, MovieState>(
        listener: (_, state) {
          if (state is MovieLoadingState) {
            print('Loading...');
          } else if (state is MovieUpdateListState) {}
        },
        child: SafeArea(child: MovieListContainer()),
      ),
    );
  }
}

class MovieListContainer extends StatefulWidget {
  @override
  _MovieListContainerState createState() => _MovieListContainerState();
}

class _MovieListContainerState extends State<MovieListContainer> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  List<Movie> movies = [];

  _MovieListContainerState() {
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(builder: (_, state) {
      if (state is MovieUpdateListState) {
        movies = state.movies;

        return GridView.builder(
          itemCount: state.hasReachedMax
              ? state.movies.length
              : state.movies.length + 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: (16 / 24)),
          itemBuilder: (context, index) {
            return index >= state.movies.length
                ? Text('loading...')
                : MovieListItem(movie: movies[index]);
          },
          controller: _scrollController,
        );
      }

      return Container();
    });
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= _scrollThreshold) {
      context.read<MovieBloc>().add(MovieLoadMovieListEvent());
    }
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text(movie.title)));
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7)
              ]),
          child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(Env.IMAGE_URL + movie.imagePath),
                      fit: BoxFit.cover))),
        ));
  }
}
