class ApiConstance{
  static const String baseurl="https://api.themoviedb.org/3";
  static const apikey="c3435cfe40aeb079689227d82bf921d3";
  static const String nowPlayingMoviesPath="$baseurl/movie/now_playing?api_key=$apikey";
  static const String popularMoviePath="$baseurl/movie/popular?api_key=$apikey";
  static const String topRatedMoviesPath="$baseurl/movie/top_rated?api_key=$apikey";



  static String movieDetailsPath(int movieId) =>
      "$baseurl/movie/$movieId?api_key=$apikey";

  static String recommendationPath(int movieId) =>
      "$baseurl/movie/$movieId/recommendations?api_key=$apikey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';
}