import 'package:hive/hive.dart';
import 'package:movie_downloader_1/data/models/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_hive.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class MoviesBase extends HiveObject {
  MoviesBase(this.movies);
  @HiveField(0)
  List<MovieModel>? movies;

  @JsonKey(ignore: true)
  @HiveField(1)
  DateTime lastFetchDate = DateTime.now();
  factory MoviesBase.fromJson(Map<String, dynamic> json) =>
      _$MoviesBaseFromJson(json);
}
