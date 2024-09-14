import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/domain/entities/movie_detail.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/usecase/get_movie_details_usecase.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUsecase(MovieDetailsParameters(
      movieId: event.id,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          movieDetail: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUsecase(RecommendationParameters(
      event.id,
    ));
    result.fold(
          (l) => emit(state.copyWith(
       recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
          (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
