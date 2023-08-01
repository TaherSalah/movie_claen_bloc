import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/entities/tv_movies.dart';

abstract class BaseMovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie();

  Future<Either<ServerFailure, List<Movie>>> getPopularMovie();

  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovie();
  Future<Either<ServerFailure, List<TvMovie>>> getTvTrendingMovie();
}
