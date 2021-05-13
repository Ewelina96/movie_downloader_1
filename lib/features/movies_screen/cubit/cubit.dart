import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.moviesRepository}) : super(InitialState());

  final MoviesRepository moviesRepository;

  void getMovies() async {
    try {
      emit(LoadingState());
      final moviesResponse = await moviesRepository.getMovies();
      if (moviesResponse.data != null) {
        emit(LoadedState(moviesResponse.data!.movies!));
      } else if (moviesResponse.error != null) {
        emit(ErrorState());
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
