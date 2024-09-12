import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/models/movies_model.dart';
import 'package:movieapp/core/network/api_constance.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MovieDataSource extends BaseMovieRemoteDatasource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MoviesModel.fromjson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MoviesModel.fromjson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async{
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => MoviesModel.fromjson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }



}
}
