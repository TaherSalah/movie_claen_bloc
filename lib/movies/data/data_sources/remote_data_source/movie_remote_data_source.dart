import 'package:movie_db_bloc/core/exports/exports_files.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTpoRatedMovie();
}

class MovieRemoteDataSource extends BaseRemoteMovieDataSource {
  final Dio dio = Dio();

  @override
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

  @override
  Future<List<MovieModel>> getPopularMovie() {
    // TODO: implement getPopularMovie
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTpoRatedMovie() {
    // TODO: implement getTpoRatedMovie
    throw UnimplementedError();
  }
}
