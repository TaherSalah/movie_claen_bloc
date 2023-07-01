import 'dart:developer';

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
  Future<List<MoviesResponse>> getMovie(MovieRequest param) async {
    List<MoviesResponse> res = <MoviesResponse>[];
    // TODO: implement getMovie
    try {
      await _dioManager
          .get('discover/movie', parameters: param.toJson())
          .then((response) {
        res = (MoviesResponse.fromJson(response.data['results']) as List)
            .map((e) => MoviesResponse.fromJson(e))
            .toList();
      });
    } on Exception catch (e) {
      log(e.toString());
      return res;
      // TODO
    }
    return res;
  }

  //////// ****** Movie  Search  Data Method         ****** ////////

  @override
  Future<List<MoviesResponse>> getMovieByQuery(MovieQueryRequest param) async {
    // TODO: implement getMovieByQuery
    List<MoviesResponse> res = <MoviesResponse>[];
    try {
      await _dioManager
          .get('search/movie', parameters: param.toJson())
          .then((response) {
        res = (response.data as List)
            .map((e) => MoviesResponse.fromJson(e))
            .toList();
      });
    } on Exception catch (e) {
      log(e.toString());
      return res;
      // TODO
    }
    return res;
  }

  //////// ****** Movie  Details Get Data Method         ****** ////////
  @override
  Future<List<MovieResponse?>> getMovieDetails(
      MovieDetailsRequest param) async {
    // TODO: implement getMovieDetails

    try {
      return await _dioManager

          ////***** i'm called apiKey from prams in request layer  *****////
          .get('movie/${param.apiKey}', parameters: param.toJson())
          .then((response) async {
        return MovieResponse.fromJson(response.data);
      });
    } on Exception catch (e) {
      log(e.toString());
      return null;
      // TODO
    }
  }

  //////// ****** Movie  Filter  Data Method         ****** ////////

  @override
  Future<List<MoviesResponse>> getMovieFilter(MovieFilterRequest param) async {
    // TODO: implement getMovieFilter
    List<MoviesResponse> res = <MoviesResponse>[];
    try {
      await _dioManager
          .get('discover/movie', parameters: param.toJson())
          .then((response) {
        res = (response.data as List)
            .map((e) => MoviesResponse.fromJson(e))
            .toList();
      });
    } on Exception catch (e) {
      log(e.toString());
      return res;
      // TODO
    }
    return res;
  }
}
