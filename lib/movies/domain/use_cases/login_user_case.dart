import 'package:dartz/dartz.dart';
import 'package:movie_db/core/error/failure.dart';
import 'package:movie_db/core/use_cases/base_use_case.dart';
import 'package:movie_db/movies/domain/repositories/base_movie_repostory.dart';


class LoginUserUseCase extends BaseLogInUseCases <dynamic> {
  final BaseMovieRepository baseMovieRepository;

  LoginUserUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, dynamic>> call() {

    // TODO: implement call
    throw UnimplementedError();
  }







}
