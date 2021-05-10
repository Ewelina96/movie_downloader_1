import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_downloader_1/data/api/movies_repository.dart';
import 'package:movie_downloader_1/data/models/movie_model.dart';
import 'package:movie_downloader_1/data/models/movies_hive.dart';
import 'package:movie_downloader_1/data/models/movies_response_model.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/cubit.dart';
import 'package:movie_downloader_1/features/movies_screen/cubit/moviesState.dart';
import 'movies_screen_test.mocks.dart';

@GenerateMocks([MoviesRepository])
void main() {
  var movieRepository = MockMoviesRepository();
  late MoviesCubit moviesCubit;

  final movies = [
    MovieModel(title: 'Movie 1'),
    MovieModel(title: 'Movie 2'),
  ];

  final moviesResponse = MoviesResponse(data: MoviesBase(movies));

  setUp(() {
    when(movieRepository.getMovies()).thenAnswer((_) async => moviesResponse);
  });

  test('Emits movies when repository answer properly', () async {
    moviesCubit = MoviesCubit(moviesRepository: movieRepository);

    await expectLater(
      moviesCubit.stream,
      emits(
        isA<LoadedState>(),
      ),
    );
  });
}

//   blocTest(
//     'Emits movies when repository answer properly',
//     build: () => MoviesCubit(moviesRepository: movieRepository),
//     act: (MoviesCubit cubit) {
//       when(movieRepository.getMovies()).thenAnswer((_) async => moviesResponse);
//       cubit.getMovies();
//     },
//     expect: () => [
//       isA<LoadingState>(),
//       isA<LoadedState>(),
//     ],
//   );
// }
