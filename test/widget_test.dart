import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/data/models/movie_model.dart';
import 'package:movie_downloader_1/data/models/movies_hive.dart';
import 'package:movie_downloader_1/data/models/movies_response_model.dart';
import 'package:movie_downloader_1/features/main_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/main_screen/cubit/moviesState.dart';

class MockRepository extends Mock implements MoviesRepository {}

void main() {
  late MockRepository movieRepository;
  late MoviesCubit moviesCubit;

  final movies = [
    MovieModel(title: 'Movie 1'),
    MovieModel(title: 'Movie 2'),
  ].toList();

  final moviesResponse = MoviesResponse(data: MoviesBase(movies));

  setUp(() {
    movieRepository = MockRepository();
    when(movieRepository.getMovies())
        .thenAnswer((_) => Future.value(moviesResponse));
  });

  test('Emits movies when repository answer properly', () async {
    moviesCubit = MoviesCubit(moviesRepository: movieRepository);

    await expectLater(
      moviesCubit.stream,
      emits(
        LoadingState(),
      ),
    );
    await expectLater(
      moviesCubit.stream,
      emits(
        LoadedState(movies),
      ),
    );
  });
}
