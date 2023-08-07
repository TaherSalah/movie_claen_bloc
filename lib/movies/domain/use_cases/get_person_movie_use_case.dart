import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_movies.dart';

class GetPersonMovieUseCase extends BaseUseCases<List<PersonMovies>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPersonMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<PersonMovies>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPersonTrendingMovie();
  }
}
