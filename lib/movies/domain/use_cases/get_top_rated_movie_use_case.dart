import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetTopRatedMovieUseCase extends BaseUseCases<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getTopRatedMovie();
  }
}
