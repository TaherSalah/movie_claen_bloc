import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_tv_trending_movie_use_case.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  final GetTvTrendingMovieUseCase getTvTrendingMovieUseCase;

  MovieBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase,this.getTvTrendingMovieUseCase)
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
    on<GetTvTrendingMoviesEvent>((event, emit) async {
      final res = await GetTvTrendingMovieUseCase(sl()).execute();
      res.fold(
          (failure) => {
                /////// copy with take new states //////
                emit(state.copyWith(
                    getTvTrendingMoviesState: RequestStates.error,
                    tvTrendingMessage: failure.message))
              },
          (success) => {
                emit(state.copyWith(
                    getTvTrendingMovies: success,
                    getTvTrendingMoviesState: RequestStates.loaded))
              });
    });

  }
}
