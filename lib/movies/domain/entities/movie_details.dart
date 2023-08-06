import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;

  final List<Genres> genres;
  final String homepage;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  const MovieDetails(
      {required this.backdropPath,
      required this.homepage,
      required this.genres,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.runtime,
      required this.status,
      required this.tagline,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount});

  @override
  List<Object> get props => [
        backdropPath,
        homepage,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
