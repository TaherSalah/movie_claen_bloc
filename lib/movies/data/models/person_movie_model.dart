import 'package:movie_db_bloc/movies/domain/entities/person_movies.dart';

class PersonModel extends PersonMovies {
  const PersonModel(
      {required super.adult,
      required super.id,
      required super.name,
      required super.originalName,
      required super.mediaType,
      required super.popularity,
      required super.knownForDepartment,
      required super.profilePath,
      // required super.knownFor
      });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
        adult: json['adult'],
        id: json['id']??0,
        name: json['name']??'',
        originalName: json['original_name']??'',
        mediaType: json['media_type']??'',
        popularity: json['popularity'].toDouble(),
        knownForDepartment: json['known_for_department']??'',
        profilePath: json['profile_path']??'',
        // knownFor: List<KnownFor>.from(json['known_for'].map((e) => e)
        // )

    )
    ;
  }
}
