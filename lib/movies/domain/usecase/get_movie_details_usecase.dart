import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movieapp/core/error/faliure.dart';
import 'package:movieapp/core/usecase/base_usecase.dart';


import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';


class GetMovieDetailsUsecase extends BaseUsecase<MovieDetail,MovieDetailsParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Faliure, MovieDetail>> call(MovieDetailsParameters parameters) async{
    return await baseMovieRepository.getMovieDetails(parameters);
  }


}
class MovieDetailsParameters extends Equatable{
  final int movieId;

  const MovieDetailsParameters( {required this.movieId});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}