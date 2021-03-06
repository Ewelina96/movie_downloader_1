// Mocks generated by Mockito 5.0.7 from annotations
// in movie_downloader_1/test/movie_screen_test.dart/movies_screen_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_downloader_1/data/api/movies_repository.dart' as _i3;
import 'package:movie_downloader_1/data/models/movies_response_model.dart'
    as _i2;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeMoviesResponse extends _i1.Fake implements _i2.MoviesResponse {}

/// A class which mocks [MoviesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesRepository extends _i1.Mock implements _i3.MoviesRepository {
  MockMoviesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.MoviesResponse> getMovies() => (super.noSuchMethod(
          Invocation.method(#getMovies, []),
          returnValue: Future<_i2.MoviesResponse>.value(_FakeMoviesResponse()))
      as _i4.Future<_i2.MoviesResponse>);
}
