import 'dart:async';

import "package:bloc/bloc.dart";
import 'package:movieapp/core/utils/enums.dart';
import 'package:movieapp/movies/data/datasource/movie_data_source.dart';
import 'package:movieapp/movies/data/repository/movies_repository.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domain/usecase/get_now_playing_movie_usecase.dart';
import 'package:movieapp/movies/presentation/controller/movies_state.dart';

import '../../domain/usecase/get_popular_movies_usecase.dart';
import '../../domain/usecase/get_top_rated_movies_usecase.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(this.getNowPlayingMovieUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<MoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_topRated);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMovieUsecase();

    result.fold(
            (l) => (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
            (r) => emit(state.copyWith(
                nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase();

    result.fold(
        (l) => (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _topRated(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase();

    result.fold(
        (l) => (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }
}
