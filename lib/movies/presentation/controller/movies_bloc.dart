import 'package:movie_db_bloc/core/exports/exports_files.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MovieBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final res = await GetNowPlayingMovieUseCase(sl()).execute();

      /////*** for change the state error and success ***////
      res.fold(
          (failure) => {
                emit(state.copyWith(
                    getNowPlayingMoviesState: RequestStates.error,
                    getNowPlayingMessage: failure.message))
              },
          (success) => {
                emit(state.copyWith(
                  getNowPlayingMovies: success,
                  getNowPlayingMoviesState: RequestStates.loaded,
                ))
              });
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final res = await GetPopularMovieUseCase(sl()).execute();
      res.fold(
          (failure) => {
                /////// copy with take new states //////
                emit(state.copyWith(
                    getPopularMoviesState: RequestStates.error,
                    popularMessage: failure.message))
              },
          (success) => {
                emit(state.copyWith(
                    getPopularMovies: success,
                    getPopularMoviesState: RequestStates.loaded))
              });
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final res = await GetTopRatedMovieUseCase(sl()).execute();
      res.fold(
          (failure) => {
                /////// copy with take new states //////
                emit(state.copyWith(
                    getTopRatedMoviesState: RequestStates.error,
                    topRatedMessage: failure.message))
              },
          (success) => {
                emit(state.copyWith(
                    getTopRatedMovies: success,
                    getTopRatedMoviesState: RequestStates.loaded))
              });
    });

  }
}
