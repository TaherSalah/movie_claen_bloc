import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';

class GetNowPlayingMovieUseCase
    extends BaseUseCases<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
