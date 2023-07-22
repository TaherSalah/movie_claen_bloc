import 'package:movie_db_bloc/core/exports/exports_files.dart';



class MovieRemoteDataSource {
  final Dio dio = Dio();

  Future<List<MovieModel>> getNowPlayingMovie() async {
    final response = await dio.get(AppConstance.baseUrl);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw (

          /////////////////////***** for display exception from error model ********////////////////////
          ServerException(
              errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }
}
