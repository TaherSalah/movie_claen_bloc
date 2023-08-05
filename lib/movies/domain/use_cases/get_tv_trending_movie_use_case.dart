import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetTvTrendingMovieUseCase extends BaseUseCases <List<TvMovie>> {
  final BaseMovieRepository baseMovieRepository;

  GetTvTrendingMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<TvMovie>>> call() async{
    // TODO: implement call
    return await baseMovieRepository.getTvTrendingMovie();

  }




}
