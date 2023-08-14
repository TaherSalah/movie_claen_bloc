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
    topRatedMessage,
    getTvTrendingMovies,
    getTvTrendingMoviesState,
    tvTrendingMessage,
    getPersonTrendingMovies,
    getPersonTrendingMoviesState,
    personTrendingMessage,
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
  final List<TvMovie> getTvTrendingMovies;
  final RequestStates getTvTrendingMoviesState;
  final String tvTrendingMessage;

  /////*** get Tv Trending Movies states  ***/////
  final List<PersonMovies> getPersonTrendingMovies;
  final RequestStates getPersonTrendingMoviesState;
  final String personTrendingMessage;

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
    /////*** get Person Trending Movies states  ***/////
    this.getPersonTrendingMovies = const [],
    this.getPersonTrendingMoviesState = RequestStates.loading,
    this.personTrendingMessage = '',
  });
  /// TODO: copy with  method
  ///*** copy with  for resolve problem  when after create new object from movie state  ***///
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
    List<TvMovie>? getTvTrendingMovies,
    RequestStates? getTvTrendingMoviesState,
    String? tvTrendingMessage,
    List<PersonMovies>? getPersonTrendingMovies,
    RequestStates? getPersonTrendingMoviesState,
    String? personTrendingMessage,
  }) {
    return MoviesStates(
      ///////////////////// add here new data /// null //// add data from obj ////////
      getNowPlayingMovies: getNowPlayingMovies ?? this.getNowPlayingMovies,
      getNowPlayingMoviesState: getNowPlayingMoviesState ?? this.getNowPlayingMoviesState,
      getNowPlayingMessage: getNowPlayingMessage ?? this.getNowPlayingMessage,
      ////////////////////////////////*************//////////////////////////////
      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      getPopularMoviesState: getPopularMoviesState ?? this.getPopularMoviesState,
      popularMessage: popularMessage ?? this.popularMessage,
      ////////////////////////////////*************//////////////////////////////
      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      getTopRatedMoviesState: getTopRatedMoviesState ?? this.getTopRatedMoviesState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      ////////////////////////////////*************//////////////////////////////
      getTvTrendingMovies: getTvTrendingMovies ?? this.getTvTrendingMovies,
      getTvTrendingMoviesState: getTvTrendingMoviesState ?? this.getTvTrendingMoviesState,
      tvTrendingMessage: tvTrendingMessage ?? this.tvTrendingMessage,
      ////////////////////////////////*************//////////////////////////////
      getPersonTrendingMovies: getPersonTrendingMovies ?? this.getPersonTrendingMovies,
      getPersonTrendingMoviesState: getPersonTrendingMoviesState ?? this.getPersonTrendingMoviesState,
      personTrendingMessage: personTrendingMessage ?? this.personTrendingMessage,
    );
  }
}