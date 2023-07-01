import 'package:movie_db_bloc/movie/domain/response/movies_response.dart';

import '../../../../domain/requests/movie_details_request.dart';
import '../../../../domain/requests/movie_filter_request.dart';
import '../../../../domain/requests/movie_query_request.dart';
import '../../../../domain/requests/movie_request.dart';
import '../../../../domain/response/movies_details_response.dart';


////**** this for get all list from movie and query request****////


abstract class MovieRepo {
  Future<List<MoviesResponse>> getMovie(MovieRequest param);

  Future<List<MoviesResponse>> getMovieByQuery(MovieQueryRequest param);

  Future<List<MoviesResponse>> getMovieFilter(MovieFilterRequest param);

  Future<List<MovieResponse?>> getMovieDetails(MovieDetailsRequest param);
}
