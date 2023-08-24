import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/person_movies.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';

class GetPersonMovieUseCase extends BaseUseCases<
    List<PersonMovies>,
//// i send NoParameters because don't need to return any prams //////
    NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPersonMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<PersonMovies>>> call(
      NoParameters parameters) async {
    return await baseMovieRepository.getPersonTrendingMovie();
  }
}