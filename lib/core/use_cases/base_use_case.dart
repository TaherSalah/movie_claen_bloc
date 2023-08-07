import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_db_bloc/core/error/failure.dart';

abstract class BaseUseCases<T, parameters> {
  Future<Either<Failure, T>> call(parameters parameters);
}


///*** for method non parameters ***///
class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
