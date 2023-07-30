

import 'package:movie_db_bloc/core/exports/exports_files.dart';

class MoviesStates extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props =>
      [getNowPlayingMoviesState, getNowPlayingMovies, message];

  final List<Movie> getNowPlayingMovies;
  final RequestStates getNowPlayingMoviesState;
  final String message;

  const MoviesStates(
      {
        this.getNowPlayingMovies = const [],
      this.getNowPlayingMoviesState = RequestStates.loading,
      this.message = ''
      });
}
