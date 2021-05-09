import 'package:dio/dio.dart';
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

  Future<MoviesResponse> getMovies() async {
    try {
      final response = await _dio.get('$_baseUrl/list_movies.json');
      print(response.data);
      return MoviesResponse.success(response.data['data']);
    } catch (e) {
      return MoviesResponse.error(e.toString());
    }
  }
}
