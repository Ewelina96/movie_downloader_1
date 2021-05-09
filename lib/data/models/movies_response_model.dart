import 'package:movie_downloader_1/data/models/movies_hive.dart';

class MoviesResponse {
  factory MoviesResponse.success(Map<String, dynamic> map) {
    return MoviesResponse(data: MoviesBase.fromJson(map));
  }

  factory MoviesResponse.error(String error) => MoviesResponse(error: error);

  MoviesResponse({this.error, this.data});

  MoviesBase? data;
  String? error;
}
