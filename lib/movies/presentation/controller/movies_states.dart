import 'package:movie_db_bloc/core/exports/exports_files.dart';

class MoviesStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [
        getNowPlayingMoviesState,
        getNowPlayingMovies,
        getNowPlayingMessage,
        getPopularMovies,
        getPopularMoviesState,
        popularMessage,
      ];

  final List<Movie> getNowPlayingMovies;
  final RequestStates getNowPlayingMoviesState;
  final String getNowPlayingMessage;
  final List<Movie> getPopularMovies;
  final RequestStates getPopularMoviesState;
  final String popularMessage;
  final List<Movie> getTopRatedMovies;
  final RequestStates getTopRatedMoviesState;
  final String topRatedMessage;

  const MoviesStates(
      {this.getNowPlayingMovies = const [],
      this.getNowPlayingMoviesState = RequestStates.loading,
      this.getNowPlayingMessage = '',
      this.getPopularMovies = const [],
      this.getPopularMoviesState = RequestStates.loading,
      this.popularMessage = '',
      this.getTopRatedMovies = const [],
      this.getTopRatedMoviesState = RequestStates.loading,
      this.topRatedMessage = ''});

  MoviesStates copyWith(
      {List<Movie>? getNowPlayingMovies,
      RequestStates? getNowPlayingMoviesState,
      String? getNowPlayingMessage,
      List<Movie>? getPopularMovies,
      RequestStates? getPopularMoviesState,
      String? popularMessage,
      List<Movie>? getTopRatedMovies,
      RequestStates? getTopRatedMoviesState,
      String? topRatedMessage}) {
    return MoviesStates(
        ///////////////////// add here new data /// null //// add data from obj ////////
        getNowPlayingMovies: getNowPlayingMovies ?? this.getNowPlayingMovies,
        getNowPlayingMoviesState:
            getNowPlayingMoviesState ?? this.getNowPlayingMoviesState,
        getNowPlayingMessage: getNowPlayingMessage ?? this.getNowPlayingMessage,
        getPopularMovies: getPopularMovies ?? this.getPopularMovies,
        getPopularMoviesState:
            getPopularMoviesState ?? this.getPopularMoviesState,
        popularMessage: popularMessage ?? this.popularMessage,
        getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
        getTopRatedMoviesState:
            getTopRatedMoviesState ?? this.getTopRatedMoviesState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage);
  }
}
