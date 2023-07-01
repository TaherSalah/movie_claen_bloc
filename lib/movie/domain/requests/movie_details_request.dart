import 'package:movie_db_bloc/movie/shard/constant/app_value.dart';
import 'package:movie_db_bloc/movie/shard/utils/utils.dart';

class MovieDetailsRequest {
  int? movieId;
  String? apiKey, language;

  MovieDetailsRequest({
    this.movieId,
    this.apiKey,
    this.language,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apiKey ?? AppValues.apiKey;
    data['language'] = language ?? getLangCode();
// ignore: unnecessary_null_comparison

    return data;
  }
}
