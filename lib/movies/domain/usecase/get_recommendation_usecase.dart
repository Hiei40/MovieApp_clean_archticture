import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/faliure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/recommendation.dart';

class GetRecommendationUsecase extends BaseUsecase<List<Recommendation>,RecommendationParameters> {
final BaseMovieRepository baseMovieRepository;

  GetRecommendationUsecase(this.baseMovieRepository);
Future<Either<Faliure,List<Recommendation>>>call(RecommendationParameters parameters)async{

  return await baseMovieRepository.getRecommendation( parameters);

}

}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}