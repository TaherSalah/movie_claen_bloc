import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_details.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_movies.dart';
import 'package:movie_db_bloc/movies/domain/entities/recommendations.dart';
import 'package:movie_db_bloc/movies/domain/entities/tv_movies.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_person_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_recommendations_movie_use_case.dart';

abstract class BaseMovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie();

  Future<Either<ServerFailure, List<Movie>>> getPopularMovie();

  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovie();
  Future<Either<ServerFailure, List<TvMovie>>> getTvTrendingMovie();
  Future<Either<ServerFailure, List<PersonMovies>>> getPersonTrendingMovie();
  Future<Either<ServerFailure, MovieDetails>> getMovieDetails(MovieDetailsPrams parameters);
  Future <Either<ServerFailure,List<Recommendations>>>getRecommendationsMovie(RecommendationsParameters parameters);
  Future <Either<ServerFailure,PersonDetails>>getPersonDetailsMovie(PersonDetailsPrams parameters);
}
