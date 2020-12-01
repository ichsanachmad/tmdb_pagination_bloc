import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tmdb_paging/buildconfig/env.dart';
import 'package:tmdb_paging/data/reponse/getmovielistresponse/get_movie_list_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Env.API_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static ApiClient create() {
    return ApiClient(Dio());
  }

  @GET('/list/{page}?api_key=3930cf526980bf36a5abe4034f1cbdbd')
  Future<GetMovieListResponse> getMovieList(@Path('page') int page);
}
