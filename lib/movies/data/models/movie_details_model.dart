

import 'package:movie_db/movies/data/models/genres_model.dart';
import 'package:movie_db/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.homepage,
      required super.genres,
      required super.id,
      required super.originalTitle,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.runtime,
      required super.status,
      required super.tagline,
      required super.title,
      required super.video,
      required super.voteAverage,
      required super.voteCount});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          homepage: json['homepage'],
          genres: List<GenresModel>.from(
              json['genres'].map((x) => GenresModel.fromJson(x))),
          id: json['id'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          posterPath: json['poster_path'],
          releaseDate: json['release_date'],
          runtime: json['runtime'],
          status: json['status'],
          tagline: json['tagline'],
          title: json['title'],
          video: json['video'],
          voteAverage: json['vote_average'].toDouble(),
          voteCount: json['vote_count']);
}
