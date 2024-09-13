import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/entities/recommendation.dart';
import 'package:movieapp/movies/domain/usecase/get_movie_details_usecase.dart';

import '../usecase/get_recommendation_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Faliure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Faliure,List<Movie>>> getPopularMovies();

  Future<Either<Faliure,List<Movie>>>getTopRatedMovies();
  Future<Either<Faliure,MovieDetail>>getMovieDetails(MovieDetailsParameters prameters);
  Future<Either<Faliure,List<Recommendation>>> getRecommendation(RecommendationParameters parameters);

}
