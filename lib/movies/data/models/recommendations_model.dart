import 'package:movie_db_bloc/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.backdropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
          backdropPath: json["backdrop_path"] ??
              'https://www.kuleuven.be/communicatie/congresbureau/fotos-en-afbeeldingen/no-image.png/image',
          id: json['id'] ?? 0);
}
