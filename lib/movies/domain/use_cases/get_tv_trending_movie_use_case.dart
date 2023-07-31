import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetTvTrendingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTvTrendingMovieUseCase(this.baseMovieRepository);

  execute() async {
    return await baseMovieRepository.getTvTrendingMovie();
  }
}
