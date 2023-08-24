import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/movie_details.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


class GetMovieDetailsUseCase
    extends BaseUseCases<MovieDetails, MovieDetailsPrams> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsPrams parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsPrams extends Equatable {
  final int id;

  const MovieDetailsPrams({required this.id});

  @override
  List<Object> get props => [id];
}
