import 'package:equatable/equatable.dart';
import 'package:movie_db/movies/domain/entities/known_for_person.dart';

class PersonMovies extends Equatable {
  final bool adult;
  final int id;
  final String name;
  final String originalName;
  final String mediaType;
  final double popularity;
  final String knownForDepartment;
  final String profilePath;

final  List<KnownForPerson> knownFor;

  const PersonMovies({
    required this.adult,
    required this.id,
    required this.name,
    required this.originalName,
    required this.mediaType,
    required this.popularity,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor
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
        knownFor,
        profilePath
      ];
}


