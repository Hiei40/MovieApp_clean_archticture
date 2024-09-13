import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie.dart';

class GetNowPlayingMovieUsecase extends BaseUsecase<List<Movie>,NoParameters>{

  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUsecase(this.baseMovieRepository);

  @override
  Future<Either<Faliure, List<Movie>>> call(NoParameters parameters)  async{


      return await baseMovieRepository.getNowPlayingMovies();

  }



}