import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/data/models/movie_details_model.dart';
import 'package:movie_db_bloc/movies/data/models/person_movie_model.dart';
import 'package:movie_db_bloc/movies/data/models/recommendations_model.dart';
import 'package:movie_db_bloc/movies/data/models/tv_movie_model.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_recommendations_movie_use_case.dart';

import '../../../domain/use_cases/get_person_details_use_case.dart';
import '../../models/person_details_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovie();

  Future<List<MovieModel>> getPopularMovie();

  Future<List<MovieModel>> getTopRatedMovie();

  Future<List<TvMovieModel>> getTvTrendingMovie();

  Future<List<PersonModel>> getPersonTrendingMovie();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsPrams parameters);

  Future<PersonDetailsModel> getPersonDetails(PersonDetailsPrams parameters);

  Future<List<RecommendationsModel>> getRecommendationsMovie(
      RecommendationsParameters parameters);
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

  @override
  Future<List<PersonModel>> getPersonTrendingMovie() async {
    // TODO: implement getPersonTrendingMovie
    final response = await dio.get(ApiConstance.getPersonTrendingMoviePath);
    if (response.statusCode == 200) {
      return List<PersonModel>.from((response.data['results'] as List)
          .map((e) => PersonModel.fromJson(e)));
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsPrams parameters) async {
    // TODO: implement getMovieDetails
    final response =
        await dio.get(ApiConstance.getMovieDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      //TODO:- error    this   revison
      print(response.data);
      return MovieDetailsModel.fromJson(response.data);
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendationsMovie(
      RecommendationsParameters parameters) async {
    // TODO: implement getRecommendationsMovie
    final response =
        await dio.get(ApiConstance.getMovieRecommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((e) => RecommendationsModel.fromJson(e)));
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }

  @override
  Future<PersonDetailsModel> getPersonDetails(
      PersonDetailsPrams parameters) async {
    // TODO: implement getPersonDetails
    final response =
        await dio.get(ApiConstance.getPersonDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      return PersonDetailsModel.fromJson(response.data);
    } else {
      return throw (ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data)));
    }
  }
}
