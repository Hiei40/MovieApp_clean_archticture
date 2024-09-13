
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/movies/domain/entities/movie.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

import '../../../core/usecase/base_usecase.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUsecase(this.baseMovieRepository);
  @override
  Future<Either<Faliure,List<Movie>>>  call(NoParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
