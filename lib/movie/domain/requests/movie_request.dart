import 'package:movie_db_bloc/movie/shard/constant/app_value.dart';
import 'package:movie_db_bloc/movie/shard/utils/utils.dart';

class MovieRequest {
  int? page;
  String? apiKey, language, sortBy;

  MovieRequest({this.page, this.apiKey, this.language, this.sortBy});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['api_key'] = apiKey ?? AppValues.apiKey;
    data['language'] = language ?? getLangCode();
    data['sort_by'] = sortBy ?? 'popularity.desc';
    // ignore: unnecessary_null_comparison
    if (data != null) {
      data['page'] = page ?? 1;
    }

    return data;
  }
}
