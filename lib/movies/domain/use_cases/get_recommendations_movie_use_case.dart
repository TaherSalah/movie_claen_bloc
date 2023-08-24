import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/entities/recommendations.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


class GetRecommendationsMovieUseCase
    extends BaseUseCases<List<Recommendations>, RecommendationsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationsMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsParameters parameters) async {
    // TODO: implement call
    return await baseMovieRepository.getRecommendationsMovie(parameters);
  }
}

class RecommendationsParameters extends Equatable {
  final int id;

  const RecommendationsParameters(this.id);

  @override
  List<Object> get props => [id];
}
