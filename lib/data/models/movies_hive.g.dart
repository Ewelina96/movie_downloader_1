// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesBaseAdapter extends TypeAdapter<MoviesBase> {
  @override
  final int typeId = 0;

  @override
  MoviesBase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesBase(
      (fields[0] as List?)?.cast<MovieModel>(),
    )..lastFetchDate = fields[1] as DateTime;
  }

  @override
  void write(BinaryWriter writer, MoviesBase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.movies)
      ..writeByte(1)
      ..write(obj.lastFetchDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesBaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesBase _$MoviesBaseFromJson(Map<String, dynamic> json) {
  return MoviesBase(
    (json['movies'] as List<dynamic>?)
        ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MoviesBaseToJson(MoviesBase instance) =>
    <String, dynamic>{
      'movies': instance.movies,
    };
