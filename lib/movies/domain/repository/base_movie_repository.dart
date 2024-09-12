import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Faliure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Faliure,List<Movie>>> getPopularMovies();

  Future<Either<Faliure,List<Movie>>>getTopRatedMovies();
}
