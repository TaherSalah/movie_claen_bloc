import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetTopRatedMovie {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovie(this.baseMovieRepository);

  execute() async {
    return await baseMovieRepository.getTopRatedMovie();
  }
}
