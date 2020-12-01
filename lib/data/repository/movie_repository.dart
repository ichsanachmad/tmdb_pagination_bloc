import 'package:flutter/material.dart';
import 'package:tmdb_paging/data/api/api_client.dart';
import 'package:tmdb_paging/data/reponse/getmovielistresponse/get_movie_list_response.dart';

class MovieRepository {
  final ApiClient _apiClient = ApiClient.create();

  Future<GetMovieListResponse> getMovieList(int page) async {
    return await _apiClient.getMovieList(page);
  }
}
