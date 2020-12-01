import 'package:json_annotation/json_annotation.dart';
import 'package:tmdb_paging/data/model/movie/movie.dart';

part 'get_movie_list_response.g.dart';

@JsonSerializable()
class GetMovieListResponse {
  @JsonKey(name: 'created_by')
  String createdBy;

  String id;

  @JsonKey(name: 'items')
  List<Movie> movies;

  GetMovieListResponse({this.createdBy, this.id, this.movies});

  factory GetMovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieListResponseToJson(this);
}
