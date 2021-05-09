import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:movie_downloader_1/data/models/movies_hive.dart';
import 'package:movie_downloader_1/data/models/movies_response_model.dart';

class MoviesRepository {
  factory MoviesRepository.init() => MoviesRepository(_dioFactory());

  MoviesRepository(this._dio);

  final Dio _dio;
  static Dio _dioFactory() {
    var options = BaseOptions(baseUrl: _baseUrl);
    var dio = Dio(options);

    return dio;
  }

  static final _baseUrl = 'https://yts.mx/api/v2';
  static final _hiveKey = 'movies_list';

  Future<MoviesResponse> getMovies() async {
    try {
      final box = await Hive.openBox('repositoryBox');
      final _currentTime = DateTime.now();
      final MoviesBase? _moviesData = await box.get(_hiveKey);
      final _difference = _moviesData == null
          ? 0
          : _currentTime.difference(_moviesData.lastFetchDate).inDays;
      if (_moviesData == null || _difference > 10) {
        final response = await _dio.get('$_baseUrl/list_movies.json');

        final successResponse = MoviesResponse.success(response.data['data']);
        box.put(_hiveKey, successResponse.data);
        return successResponse;
      } else {
        return MoviesResponse(data: _moviesData);
      }
    } catch (e) {
      return MoviesResponse.error(e.toString());
    }
  }
}
