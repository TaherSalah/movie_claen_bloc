import 'package:movie_db_bloc/movie/shard/constant/app_value.dart';
import 'package:movie_db_bloc/movie/shard/utils/utils.dart';

class MovieFilterRequest {
  int? page, year;
  String? apiKey, language, sortBy, withGenres;

  MovieFilterRequest(
      {this.page,
      this.year,
      this.apiKey,
      this.language,
      this.sortBy,
      this.withGenres});

Map<String ,dynamic>toJson(){
  final Map<String,dynamic>data=<String,dynamic>{};
  data['api_key']=apiKey??AppValues.apiKey;
  data['language']=language??getLangCode();
  data['sort_by']=sortBy??'with_genres';
  data['with_genres']=withGenres??'';
// ignore: unnecessary_null_comparison
if(data!= null){
  data['year']=year;
}
  data['page']=page??1;
  return data;
}


}
