import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie.dart';
import 'package:movie_db_bloc/movies/domain/repositories/base_movie_repostory.dart';

class GetPopularMovieUseCase  extends BaseUseCases <List<Movie>>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async{
    return await baseMovieRepository.getPopularMovie();

  }


}
