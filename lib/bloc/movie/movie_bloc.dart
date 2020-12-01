import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_paging/bloc/movie/movie_event.dart';
import 'package:tmdb_paging/bloc/movie/movie_state.dart';
import 'package:tmdb_paging/data/repository/movie_repository.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _repo = MovieRepository();
  var _page = 1;

  MovieBloc() : super(MovieInitialState());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieLoadMovieListEvent && !_hasReachedMax(state)) {
      if (state is MovieInitialState) {
        final movie = await _repo.getMovieList(_page);
        yield MovieUpdateListState(movies: movie.movies, hasReachedMax: false);
      }

      if (state is MovieUpdateListState) {
        final currentState = state as MovieUpdateListState;
        final nextPage = await _repo.getMovieList(_page += 1);
        yield nextPage.movies.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : MovieUpdateListState(
                movies: currentState.movies + nextPage.movies,
                hasReachedMax: false);
      }
    }
  }

  bool _hasReachedMax(MovieState state) =>
      state is MovieUpdateListState && state.hasReachedMax;
}
