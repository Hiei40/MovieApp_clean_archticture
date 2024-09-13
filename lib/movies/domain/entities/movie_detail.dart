import 'package:equatable/equatable.dart';
import 'genres.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String releaseDate;
  final String runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object?> get props =>
      [backdropPath, id, releaseDate, runtime, title, voteAverage, genres];
}
