import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/exceptions.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/movies/data/data_sources/remote_data_source/movie_remote_data_source.dart';
import 'package:movie_db/movies/domain/entities/movie.dart';
import 'package:movie_db/movies/domain/entities/movie_details.dart';
import 'package:movie_db/movies/domain/entities/person_details.dart';
import 'package:movie_db/movies/domain/entities/person_movies.dart';
import 'package:movie_db/movies/domain/entities/recommendations.dart';
import 'package:movie_db/movies/domain/entities/tv_movies.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';
import 'package:movie_db/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db/movies/domain/use_cases/get_person_details_use_case.dart';
import 'package:movie_db/movies/domain/use_cases/get_recommendations_movie_use_case.dart';


class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepository(this.baseRemoteMovieDataSource);

  ///*** Now Playing  ***///

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie() async {
    // TODO: implement getNowPlayingMovie

    final dataRes = await baseRemoteMovieDataSource.getNowPlayingMovie();
    try {
      return Right(dataRes);

      ////******   i passing server Exception and catching error to failure ********/////
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** Popular ***///

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovie() async {
    // TODO: implement getPopularMovie
    final dataRes = await baseRemoteMovieDataSource.getPopularMovie();

    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** Top Rated ***///

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovie() async {
    // TODO: implement getTopRatedMovie
    final dataRes = await baseRemoteMovieDataSource.getTopRatedMovie();
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** TV Trending ***///

  @override
  Future<Either<ServerFailure, List<TvMovie>>> getTvTrendingMovie() async {
    // TODO: implement getTopRatedMovie
    final dataRes = await baseRemoteMovieDataSource.getTvTrendingMovie();
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** Person Trending ***///

  @override
  Future<Either<ServerFailure, List<PersonMovies>>>
      getPersonTrendingMovie() async {
    // TODO: implement getPersonTrendingMovie
    final dataRes = await baseRemoteMovieDataSource.getPersonTrendingMovie();

    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** Details ***///

  @override
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsPrams parameters) async {
    // TODO: implement getMovieDetails
    final dataRes = await baseRemoteMovieDataSource.getMovieDetails(parameters);
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  ///*** Recommendations ***///

  @override
  Future<Either<ServerFailure, List<Recommendations>>> getRecommendationsMovie(
      RecommendationsParameters parameters) async {
    // TODO: implement getRecommendationsMovie
    final dataRes =
        await baseRemoteMovieDataSource.getRecommendationsMovie(parameters);
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<ServerFailure, PersonDetails>> getPersonDetailsMovie(
      PersonDetailsPrams parameters) async {
    // TODO: implement getPersonDetailsMovie
    final dataRes =
        await baseRemoteMovieDataSource.getPersonDetails(parameters);
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<ServerFailure, dynamic>> getLoginUser(PersonDetailsPrams parameters) {
    // TODO: implement getLoginUser
    throw UnimplementedError();
  }
}
