
import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';

class GetNowPlayingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);

  Future<Either<ServerFailure,List<Movie>>> execute() async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
