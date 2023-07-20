class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        adult: json['adult'],
        backdropPath: json['backdrop_path'] ?? '',
        genreIds: json['genre_ids'] ?? [],
        id: json['id'],
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        popularity: json['popularity'],
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        title: json['title'] ?? '',
        voteAverage: json['vote_average']);
  }
}
