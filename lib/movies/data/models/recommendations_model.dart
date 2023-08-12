import 'package:movie_db_bloc/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.backdropPath, required super.id});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(backdropPath: json["backdrop_path"], id: json['id']);
}
