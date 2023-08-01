import 'package:equatable/equatable.dart';

class TvMovie extends Equatable {
  final bool adult;
  final String backdropPath;
  final int id;
  final String name;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String firstAirDate;
  final double voteAverage;
  final int voteCount;
  final List<String> originCountry;

  const TvMovie(
      {required this.adult,
      required this.backdropPath,
      required this.id,
      required this.name,
      required this.originalLanguage,
      required this.originalName,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.firstAirDate,
      required this.voteAverage,
      required this.voteCount,
      required this.originCountry});

  @override
  // TODO: implement props
  List<Object?> get props => [
        adult,
        backdropPath,
        id,
        name,
        originalLanguage,
        originalName,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        firstAirDate,
        voteAverage,
        voteCount,
        originCountry
      ];

// Results.fromJson(Map<String, dynamic> json) {
//   adult = json['adult'];
//   backdropPath = json['backdrop_path'];
//   id = json['id'];
//   name = json['name'];
//   originalLanguage = json['original_language'];
//   originalName = json['original_name'];
//   overview = json['overview'];
//   posterPath = json['poster_path'];
//   mediaType = json['media_type'];
//   genreIds = json['genre_ids'].cast<int>();
//   popularity = json['popularity'];
//   firstAirDate = json['first_air_date'];
//   voteAverage = json['vote_average'];
//   voteCount = json['vote_count'];
//   originCountry = json['origin_country'].cast<String>();
}
