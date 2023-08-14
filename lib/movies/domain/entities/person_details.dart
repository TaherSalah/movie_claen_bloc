import 'package:equatable/equatable.dart';

class PersonDetails extends Equatable {
  final List<String> alsoKnownAs;
  final String biography;
  final String birthday;
  final int gender;
  final int id;
  final String imdbId;
  final String knownForDepartment;
  final String name;
  final String placeOfBirth;
  final double popularity;
  final String profilePath;

  const PersonDetails(
      {required this.alsoKnownAs,
      required this.biography,
      required this.birthday,
      required this.gender,
      required this.id,
      required this.imdbId,
      required this.knownForDepartment,
      required this.name,
      required this.placeOfBirth,
      required this.popularity,
      required this.profilePath});

  @override
  List<Object> get props => [
        alsoKnownAs,
        biography,
        birthday,
        gender,
        id,
        imdbId,
        knownForDepartment,
        name,
        placeOfBirth,
        popularity,
        profilePath,
      ];
}
