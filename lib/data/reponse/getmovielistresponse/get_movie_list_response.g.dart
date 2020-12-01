// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieListResponse _$GetMovieListResponseFromJson(Map<String, dynamic> json) {
  return GetMovieListResponse(
    createdBy: json['created_by'] as String,
    id: json['id'] as String,
    movies: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetMovieListResponseToJson(
        GetMovieListResponse instance) =>
    <String, dynamic>{
      'created_by': instance.createdBy,
      'id': instance.id,
      'items': instance.movies,
    };
