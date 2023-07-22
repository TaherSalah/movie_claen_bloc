import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetNowPlayingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
