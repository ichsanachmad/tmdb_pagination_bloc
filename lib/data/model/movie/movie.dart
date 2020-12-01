import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  int id;

  @JsonKey(name: 'poster_path')
  String imagePath;

  @JsonKey(name: 'original_title')
  String title;

  String overview;

  Movie({this.id, this.imagePath});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
