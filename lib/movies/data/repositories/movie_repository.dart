
import 'package:dartz/dartz.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseRemoteMovieDataSource baseRemoteMovieDataSource;

  MovieRepository(this.baseRemoteMovieDataSource);

  @override
  Future<Either<ServerFailure, List<Movie>>> getNowPlayingMovie() async {
    // TODO: implement getNowPlayingMovie

    final dataRes = await baseRemoteMovieDataSource.getNowPlayingMovie();
    try {
      return Right(dataRes);

      ////******   i passing server Exception and catching error to failure ********/////
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovie() async {
    // TODO: implement getPopularMovie
    final dataRes = await baseRemoteMovieDataSource.getPopularMovie();

    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTopRatedMovie() async {
    // TODO: implement getTopRatedMovie
    final dataRes = await baseRemoteMovieDataSource.getTopRatedMovie();
    try {
      return Right(dataRes);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
