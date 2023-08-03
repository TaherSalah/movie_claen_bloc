import 'package:equatable/equatable.dart';

class PersonMovies extends Equatable {
  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final String mediaType;
  final double popularity;
  final String knownForDepartment;
  final String profilePath;

// final  List<KnownFor> knownFor;

  const PersonMovies({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    required this.popularity,
    required this.knownForDepartment,
    required this.profilePath,
    // required this.knownFor
  });

  @override
  List<Object> get props => [
        name,
        adult,
        id,
        originalName,
        mediaType,
        popularity,
        knownForDepartment,
        // knownFor,
        profilePath
      ];
}

// class KnownFor {
//   final  String backdropPath;
//   final  int id;
//   final  String title;
//   final String originalLanguage;
//   final String originalTitle;
//   final String overview;
//   final String posterPath;
//   final String mediaType;
//   final  List<int> genreIds;
//   final  double popularity;
//   final  String releaseDate;
//   final bool video;
//   final  double voteAverage;
//   final  int voteCount;
//
// const  KnownFor(
//       {required this.backdropPath,
//       required this.id,
//       required this.title,
//       required this.originalLanguage,
//       required this.originalTitle,
//       required this.overview,
//       required this.posterPath,
//       required this.mediaType,
//       required this.genreIds,
//       required this.popularity,
//       required this.releaseDate,
//       required this.video,
//       required this.voteAverage,
//       required this.voteCount});
//
//
//
//   factory KnownFor.fromJson(Map<String, dynamic> json) {
//     return KnownFor(
//         backdropPath: json['backdrop_path'],
//         id: json['id'],
//         title: json['title'],
//         originalLanguage: json['original_language'],
//         originalTitle: json['original_title'],
//         overview: json['overview'],
//         posterPath: json['poster_path'],
//         mediaType: json['media_type'],
//         genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
//         popularity: json['popularity'],
//         releaseDate: json['release_date'],
//         video: json['video'],
//         voteAverage: json['vote_average'],
//         voteCount: json['vote_count']);
//   }
//
//
// }
