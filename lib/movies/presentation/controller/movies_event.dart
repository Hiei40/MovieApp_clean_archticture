part of 'movies_bloc.dart';

abstract class MoviesEvent {
  const MoviesEvent();
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}
class GetPopularEvent extends MoviesEvent {}
class GetTopRatedMoviesEvent extends MoviesEvent {}
