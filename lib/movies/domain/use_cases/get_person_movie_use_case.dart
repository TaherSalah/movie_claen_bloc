
import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_movies.dart';

class GetPersonMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPersonMovieUseCase(this.baseMovieRepository);

  Future<Either<ServerFailure,List<PersonMovies>>> execute() async {
    return await baseMovieRepository.getPersonTrendingMovie();
  }
}
