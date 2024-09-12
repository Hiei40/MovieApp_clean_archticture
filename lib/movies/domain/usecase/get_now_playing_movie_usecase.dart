import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMovieUsecase{

  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUsecase(this.baseMovieRepository);

  Future<Either<Faliure,List<Movie>>>  call()async {

    return await baseMovieRepository.getNowPlayingMovies();

  }

}