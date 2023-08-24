import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/person_details.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


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
