import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/tv_movies.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


class GetTvTrendingMovieUseCase extends BaseUseCases <List<TvMovie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetTvTrendingMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<TvMovie>>> call(NoParameters parameters) async{
    // TODO: implement call
    return await baseMovieRepository.getTvTrendingMovie();

  }




}
