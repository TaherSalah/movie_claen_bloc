
import 'package:movie_db/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.adult,
      required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.popularity,
      required super.posterPath,
      required super.releaseDate,
      required super.title,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        adult: json['adult'],
        backdropPath: json['backdrop_path'] ?? '',
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        id: json['id'],
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        popularity: json['popularity']??0.0,
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        title: json['title'] ?? '',
        voteAverage: json['vote_average'].toDouble()
    );
  }
}
