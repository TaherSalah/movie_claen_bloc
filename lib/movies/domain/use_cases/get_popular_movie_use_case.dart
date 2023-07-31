import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetPopularMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);

  Future<Either<ServerFailure,List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovie();
  }
}
