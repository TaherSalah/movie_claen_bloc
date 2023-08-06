import 'package:equatable/equatable.dart';

class KnownForPerson extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String mediaType;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final num voteAverage;
  final num voteCount;

  const KnownForPerson(
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


  @override
  List<Object> get props => [
        backdropPath,
        id,
        title,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        mediaType,
        genreIds,
        popularity,
        releaseDate,
        video,
        voteAverage,
        voteCount,
      ];
}
