import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/error/failure.dart';

abstract class BaseUseCases<T> {
  Future<Either<Failure, T>> call();
}
