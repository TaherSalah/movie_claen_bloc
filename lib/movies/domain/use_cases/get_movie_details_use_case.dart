import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';

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
