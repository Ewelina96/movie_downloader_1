import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/moviesState.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.moviesRepository}) : super(InitialState()) {
    this.getMovies();
  }

  final MoviesRepository moviesRepository;

  void getMovies() async {
    try {
      emit(LoadingState());
      final moviesResponse = await moviesRepository.getMovies();
      emit(LoadedState(moviesResponse.data!.movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
