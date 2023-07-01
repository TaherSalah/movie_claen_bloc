import 'package:movie_db_bloc/movie/shard/constant/app_value.dart';
import 'package:movie_db_bloc/movie/shard/utils/utils.dart';

class MovieQueryRequest {
  int? page;
  String? apiKey, query, language;

  MovieQueryRequest({this.page, this.apiKey, this.query, this.language});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['api_key'] = apiKey ?? AppValues.apiKey;
    data['language'] = language ?? getLangCode();
    data['query'] = query ?? '';
    // ignore: unnecessary_null_comparison
    if (data != null) {
      data['page'] = page ?? 1;
    }

    return data;
  }
}
