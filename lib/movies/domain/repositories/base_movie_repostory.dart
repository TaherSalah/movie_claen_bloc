import 'package:movie_db_bloc/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository{
  Future<List<Movie>>getNowPlayingMovie();
  Future<List<Movie>>getPopularMovie();
  Future<List<Movie>>getTopRatedMovie();
}