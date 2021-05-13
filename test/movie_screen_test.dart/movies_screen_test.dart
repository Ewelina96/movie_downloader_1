// import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/data/models/movie_model.dart';
import 'package:movie_downloader_1/data/models/movies_hive.dart';
import 'package:movie_downloader_1/data/models/movies_response_model.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/movies_state.dart';
import 'movies_screen_test.mocks.dart';

@GenerateMocks([MoviesRepository])
void main() {
  late MoviesCubit moviesCubit;
  late MoviesRepository moviesRepository;

  final movies = [
    MovieModel(title: 'Movie 1'),
    MovieModel(title: 'Movie 2'),
  ];

  final moviesResponse = MoviesResponse(data: MoviesBase(movies));

  setUp(() {
    moviesRepository = MockMoviesRepository();
    moviesCubit = MoviesCubit(moviesRepository: moviesRepository);
  });

  tearDown(() => moviesCubit.close());
  group('Cubit', () {
    test('Emits movies when repository answer properly', () async {
      when(moviesRepository.getMovies())
          .thenAnswer((_) async => moviesResponse);
      moviesCubit.getMovies();
      await expectLater(
        moviesCubit.stream,
        emits(
          isA<LoadedState>(),
        ),
      );
    });

    test('Emits movies when repository throw error', () async {
      when(moviesRepository.getMovies())
          .thenAnswer((_) async => MoviesResponse.error('TEST ERROR'));
      moviesCubit.getMovies();

      await expectLater(
        moviesCubit.stream,
        emits(
          isA<ErrorState>(),
        ),
      );
    });
  });
}

  // blocTest(
  //   'Emits movies when repository answer properly',
  //   build: () => MoviesCubit(moviesRepository: movieRepository),
  //   act: (MoviesCubit cubit) {
  //     when(movieRepository.getMovies()).thenAnswer((_) async => moviesResponse);
  //     cubit.getMovies();
  //   },
  //   expect: () => [
  //     isA<LoadingState>(),
  //     isA<LoadedState>(),
  //   ],
  // );

