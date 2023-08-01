import 'package:movie_db_bloc/movies/domain/entities/tv_movies.dart';

class TvMovieModel extends TvMovie {
  const TvMovieModel(
      {required super.adult,
      required super.backdropPath,
      required super.id,
      required super.name,
      required super.originalLanguage,
      required super.originalName,
      required super.overview,
      required super.posterPath,
      required super.mediaType,
      required super.genreIds,
      required super.popularity,
      required super.firstAirDate,
      required super.voteAverage,
      required super.voteCount,
      required super.originCountry});

  factory TvMovieModel.fromJson(Map<String, dynamic> json) {
    return TvMovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        originalLanguage: json['original_language'] ?? '',
        originalName: json['original_name'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        mediaType: json['media_type'] ?? '',
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        popularity: json['popularity'],
        firstAirDate: json['first_air_date'],
        voteAverage: json['vote_average'].toDouble() ?? 0.1,
        voteCount: json['vote_count'] ?? 1,
        originCountry: List<String>.from(json['origin_country'].map((e) => e)));
  }
}
