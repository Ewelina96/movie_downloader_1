import 'package:movie_downloader_1/data/models/movie_model.dart';

abstract class MoviesState {}

class InitialState extends MoviesState {
  List<Object> get props => [];
}

class LoadingState extends MoviesState {
  List<Object> get props => [];
}

class LoadedState extends MoviesState {
  LoadedState(this.movies);

  final List<MovieModel>? movies;

  List<Object> get props => [movies!];
}

class ErrorState extends MoviesState {
  List<Object> get props => [];
}
