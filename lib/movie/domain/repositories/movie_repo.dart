import 'package:movie_db_bloc/movie/data/data_sources/remote/repositories/movie_repo.dart';
import 'package:movie_db_bloc/movie/domain/requests/movie_details_request.dart';
import 'package:movie_db_bloc/movie/domain/requests/movie_filter_request.dart';
import 'package:movie_db_bloc/movie/domain/requests/movie_query_request.dart';
import 'package:movie_db_bloc/movie/domain/requests/movie_request.dart';
import 'package:movie_db_bloc/movie/domain/response/movies_details_response.dart';
import 'package:movie_db_bloc/movie/domain/response/movies_response.dart';
import 'package:movie_db_bloc/movie/shard/core/network/dio_manager.dart';

class MovieReposatry extends MovieRepo {
  DioManager _dioManager;

  MovieReposatry(this._dioManager);

  //////// ****** ALL Movie   Data Method       ****** ////////

  @override
  Future<List<MoviesResponse>> getMovie(MovieRequest param) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  //////// ****** Movie  Search  Data Method         ****** ////////

  @override
  Future<List<MoviesResponse>> getMovieByQuery(MovieQueryRequest param) {
    // TODO: implement getMovieByQuery
    throw UnimplementedError();
  }

  //////// ****** Movie  Details Get Data Method         ****** ////////
  @override
  Future<List<MovieResponse?>> getMovieDetails(MovieDetailsRequest param) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  //////// ****** Movie  Filter  Data Method         ****** ////////

  @override
  Future<List<MoviesResponse>> getMovieFilter(MovieFilterRequest param) {
    // TODO: implement getMovieFilter
    throw UnimplementedError();
  }
}
