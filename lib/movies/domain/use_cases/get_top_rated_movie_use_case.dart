import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetTopRatedMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  execute() async {
    return await baseMovieRepository.getTopRatedMovie();
  }
}
