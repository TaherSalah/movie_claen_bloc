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
        getTopRatedMovies,
        getTopRatedMoviesState,
        topRatedMessage
      ];

/////*** get Now Playing Movies states  ***/////
  final List<Movie> getNowPlayingMovies;
  final RequestStates getNowPlayingMoviesState;
  final String getNowPlayingMessage;

  /////*** get Popular Movies states  ***/////

  final List<Movie> getPopularMovies;
  final RequestStates getPopularMoviesState;
  final String popularMessage;

  /////*** get Top Rated Movies states  ***/////

  final List<Movie> getTopRatedMovies;
  final RequestStates getTopRatedMoviesState;
  final String topRatedMessage;

  /////*** get Tv Trending Movies states  ***/////

  final List<Movie> getTvTrendingMovies;
  final RequestStates getTvTrendingMoviesState;
  final String tvTrendingMessage;

  const MoviesStates({
    /////*** get now playing  Movies states  ***/////
    this.getNowPlayingMovies = const [],
    this.getNowPlayingMoviesState = RequestStates.loading,
    this.getNowPlayingMessage = '',
    /////*** get Popular Movies states  ***/////
    this.getPopularMovies = const [],
    this.getPopularMoviesState = RequestStates.loading,
    this.popularMessage = '',
    /////*** get Top Rated Movies states  ***/////
    this.getTopRatedMovies = const [],
    this.getTopRatedMoviesState = RequestStates.loading,
    this.topRatedMessage = '',
    /////*** get Tv Trending Movies states  ***/////
    this.getTvTrendingMovies = const [],
    this.getTvTrendingMoviesState = RequestStates.loading,
    this.tvTrendingMessage = '',
  });

  MoviesStates copyWith({
    List<Movie>? getNowPlayingMovies,
    RequestStates? getNowPlayingMoviesState,
    String? getNowPlayingMessage,
    List<Movie>? getPopularMovies,
    RequestStates? getPopularMoviesState,
    String? popularMessage,
    List<Movie>? getTopRatedMovies,
    RequestStates? getTopRatedMoviesState,
    String? topRatedMessage,
    List<Movie>? getTvTrendingMovies,
    RequestStates? getTvTrendingMoviesState,
    String? tvTrendingMessage,
  }) {
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
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      getTvTrendingMovies: getTvTrendingMovies ?? this.getTvTrendingMovies,
      getTvTrendingMoviesState:
          getTvTrendingMoviesState ?? this.getTvTrendingMoviesState,
      tvTrendingMessage: tvTrendingMessage ?? this.tvTrendingMessage,
    );
  }
}
