import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/data/models/tv_movie_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();
  Future<List<MovieModel>> getPopularMovie();
  Future<List<MovieModel>> getTopRatedMovie();
  Future<List<TvMovieModel>> getTvTrendingMovie();
}

class MovieRemoteDataSource extends BaseRemoteMovieDataSource {
  final Dio dio = Dio();

  @override
  Future<List<MovieModel>> getNowPlayingMovie() async {
    // TODO: implement getNowPlayingMovie

    final response = await dio.get(ApiConstance.getNowPlayingMoviePath);
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
  Future<List<MovieModel>> getPopularMovie() async {
    // TODO: implement getPopularMovie
    final response = await dio.get(ApiConstance.getPopularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovie() async {
    // TODO: implement getTpoRatedMovie
    final response = await dio.get(ApiConstance.getTopRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<TvMovieModel>> getTvTrendingMovie() async {
    // TODO: implement getTpoRatedMovie
    final response = await dio.get(ApiConstance.getTvTrendingMoviePath);
    if (response.statusCode == 200) {
      return List<TvMovieModel>.from((response.data['results'] as List)
          .map((e) => TvMovieModel.fromJson(e)));
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }
}
