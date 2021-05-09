import 'package:json_annotation/json_annotation.dart';
import 'package:movie_downloader_1/data/models/movie_model.dart';

part 'movies_response_model.g.dart';

@JsonSerializable()
class Movies {
  Movies(this.movies);

  final DateTime fetchTime = DateTime.now();
  final List<MovieModel> movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}

class MoviesResponse {
  factory MoviesResponse.success(Map<String, dynamic> map) =>
      MoviesResponse(data: Movies.fromJson(map));

  factory MoviesResponse.error(String error) => MoviesResponse(error: error);

  MoviesResponse({this.error, this.data});

  Movies? data;
  String? error;
}
