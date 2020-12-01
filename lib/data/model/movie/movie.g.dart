// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    id: json['id'] as int,
    imagePath: json['poster_path'] as String,
  )
    ..title = json['original_title'] as String
    ..overview = json['overview'] as String;
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.imagePath,
      'original_title': instance.title,
      'overview': instance.overview,
    };
