import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/movie.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


class GetPopularMovieUseCase  extends BaseUseCases <List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async{
    return await baseMovieRepository.getPopularMovie();

  }


}
