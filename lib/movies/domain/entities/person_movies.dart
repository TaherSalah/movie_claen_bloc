import 'package:equatable/equatable.dart';

class PersonMovies extends Equatable {
  bool adult;
  int id;
  String name;
  String originalName;
  String mediaType;
  double popularity;
  int gender;
  String knownForDepartment;
  String profilePath;
  List<KnownFor> knownFor;

  PersonMovies(
      {required this.adult,
      required this.id,
      required this.name,
      required this.originalName,
      required this.mediaType,
      required this.popularity,
      required this.gender,
      required this.knownForDepartment,
      required this.profilePath,
      required this.knownFor});

  @override
  List<Object> get props => [
        name,
        adult,
        id,
        originalName,
        mediaType,
        popularity,
        gender,
        knownForDepartment,
        knownFor,
        profilePath
      ];

}

class KnownFor {
  String backdropPath;
  int id;
  String title;
  String originalLanguage;
  String originalTitle;
  String overview;
  String posterPath;
  String mediaType;
  List<int> genreIds;
  double popularity;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  KnownFor(
      {required this.backdropPath,
      required this.id,
      required this.title,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.mediaType,
      required this.genreIds,
      required this.popularity,
      required this.releaseDate,
      required this.video,
      required this.voteAverage,
      required this.voteCount});



  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
        backdropPath: json['backdrop_path'],
        id: json['id'],
        title: json['title'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        popularity: json['popularity'],
        releaseDate: json['release_date'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }


}
