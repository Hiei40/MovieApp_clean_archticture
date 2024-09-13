import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/movies/data/datasource/movie_data_source.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/entities/recommendation.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../domain/usecase/get_movie_details_usecase.dart';

class MoviesRepository extends BaseMovieRepository {
  final BaseMovieRemoteDatasource baseMovieRemoteDatasource;

  MoviesRepository(this.baseMovieRemoteDatasource);


  @override
  Future<Either<Faliure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDatasource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDatasource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDatasource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, MovieDetail>> getMovieDetails(MovieDetailsParameters prameters ) async {
    final result = await baseMovieRemoteDatasource.getMovieDetails(prameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDatasource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
}
}
