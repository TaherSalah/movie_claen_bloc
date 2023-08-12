import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_movies.dart';
import 'package:movie_db_bloc/movies/domain/entities/recommendations.dart';
import 'package:movie_db_bloc/movies/domain/entities/tv_movies.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_recommendations_movie_use_case.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepository(this.baseRemoteMovieDataSource);

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

  @override
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(
      MovieDetailsPrams parameters) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovie(
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
}
