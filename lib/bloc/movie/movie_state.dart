import 'package:equatable/equatable.dart';
import 'package:tmdb_paging/data/model/movie/movie.dart';

class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieUpdateListState extends MovieState {
  final List<Movie> movies;
  final bool hasReachedMax;

  MovieUpdateListState({this.movies, this.hasReachedMax});

  @override
  List<Object> get props => [this.movies, this.hasReachedMax];

  MovieUpdateListState copyWith({
    List<Movie> movies,
    bool hasReachedMax,
  }) {
    return MovieUpdateListState(
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }
}

class MovieFailedState extends MovieState {}
