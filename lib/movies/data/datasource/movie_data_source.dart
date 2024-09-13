import 'package:dio/dio.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/movies/data/models/movies_model.dart';
import 'package:movieapp/core/network/api_constance.dart';
import 'package:movieapp/movies/data/models/recommendation_model.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';
import '../models/movies_details_model.dart';

abstract class BaseMovieRemoteDatasource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters prameters);
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters);
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

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters prameters) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(prameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(RecommendationParameters parameters) async {
    final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return (response.data["results"] as List)
          .map((e) => RecommendationModel.fromJson(e as Map<String, dynamic>)) // fromJson with capital J
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}
