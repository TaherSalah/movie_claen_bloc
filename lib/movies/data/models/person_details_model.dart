

import 'package:movie_db/core/utiles/app_constanc.dart';
import 'package:movie_db/movies/domain/entities/person_details.dart';

class PersonDetailsModel extends PersonDetails {
  const PersonDetailsModel(
      {required super.alsoKnownAs,
      required super.biography,
      required super.birthday,
      required super.gender,
      required super.id,
      required super.imdbId,
      required super.knownForDepartment,
      required super.name,
      required super.placeOfBirth,
      required super.popularity,
      required super.profilePath});

  factory PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonDetailsModel(
        alsoKnownAs: json['also_known_as'].cast<String>(),
        biography: json['biography']??'',
        birthday: json['birthday']??'',
        gender: json['gender']??0,
        id: json['id']??529,
        imdbId: json['imdb_id']??"",
        knownForDepartment: json['known_for_department']??'',
        name: json['name']??'',
        placeOfBirth: json['place_of_birth']??'',
        popularity: json['popularity']??0.0,
        profilePath: json['profile_path']??AppConstance.errorNetWorkImage);
  }
}
