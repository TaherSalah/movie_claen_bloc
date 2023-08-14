import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';
import 'package:movie_db_bloc/movies/domain/entities/person_details.dart';

class GetPersonDetailsUseCase
    extends BaseUseCases<PersonDetails, PersonDetailsPrams> {
  final BaseMovieRepository baseMovieRepository;

  GetPersonDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, PersonDetails>> call(
      PersonDetailsPrams parameters) async {
    // TODO: implement call
    return await baseMovieRepository.getPersonDetailsMovie(parameters);
  }
}

class PersonDetailsPrams extends Equatable {
  final int id;

  const PersonDetailsPrams({required this.id});

  @override
  List<Object> get props => [id];
}
