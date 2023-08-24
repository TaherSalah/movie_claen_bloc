
import 'package:movie_db/movies/domain/entities/known_for_person.dart';

class KnownForPersonModel extends KnownForPerson {
  const KnownForPersonModel(
      {required super.backdropPath,
      required super.id,
      required super.title,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.posterPath,
      required super.mediaType,
      required super.genreIds,
      required super.popularity,
      required super.releaseDate,
      required super.video,
      required super.voteAverage,
      required super.voteCount});

  factory KnownForPersonModel.fromJson(Map<String, dynamic> json) {
    return KnownForPersonModel(
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        mediaType: json['media_type'] ?? '',
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        popularity: json['popularity'] ?? '',
        releaseDate: json['release_date'] ?? '',
        video: json['video']??false,
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
