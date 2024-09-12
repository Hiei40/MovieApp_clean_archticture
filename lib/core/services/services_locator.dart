import 'package:get_it/get_it.dart';
import 'package:movieapp/movies/data/datasource/movie_data_source.dart';
import 'package:movieapp/movies/data/repository/movies_repository.dart';
import 'package:movieapp/movies/domain/repository/base_movie_repository.dart';
import 'package:movieapp/movies/domain/usecase/get_now_playing_movie_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movieapp/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:movieapp/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Data Source
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));

    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));

    sl.registerLazySingleton<BaseMovieRemoteDatasource>(() => MovieDataSource());

    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));

  }
}
