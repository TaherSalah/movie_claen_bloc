import 'dart:async';

import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/use_cases/base_use_case.dart';

import 'movies_events.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  final GetTvTrendingMovieUseCase getTvTrendingMovieUseCase;

  MovieBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase, this.getTvTrendingMovieUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMoviesEvent);
    on<GetPopularMoviesEvent>(_getPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesEvent);
    on<GetTvTrendingMoviesEvent>(_getTvTrendingMoviesEvent);
    on<GetPersonTrendingMoviesEvent>(_getPersonTrendingMoviesEvent);
  }

  ///*** getNowPlayingMoviesEvent method ***///
  FutureOr<void> _getNowPlayingMoviesEvent(
      event, Emitter<MoviesStates> emit) async {
    final res =
        await GetNowPlayingMovieUseCase(sl()).call(const NoParameters());
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
  }

  ///*** getPopularMoviesEvent method ***///

  FutureOr<void> _getPopularMoviesEvent(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final res = await GetPopularMovieUseCase(sl()).call(const NoParameters());
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
  }

  ///*** getTopRatedMoviesEvent method ***///
  FutureOr<void> _getTopRatedMoviesEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final res = await GetTopRatedMovieUseCase(sl()).call(const NoParameters());
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
  }

  ///*** getTvTrendingMoviesEvent method ***///

  FutureOr<void> _getTvTrendingMoviesEvent(
      GetTvTrendingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final res =
        await GetTvTrendingMovieUseCase(sl()).call(const NoParameters());
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
  }

  ///*** getPersonTrendingMoviesEvent method ***///
  FutureOr<void> _getPersonTrendingMoviesEvent(
      GetPersonTrendingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final res = await GetPersonMovieUseCase(sl()).call(const NoParameters());
    res.fold(
        (failure) => {
              emit(state.copyWith(
                  getPersonTrendingMoviesState: RequestStates.error,
                  personTrendingMessage: failure.message)),
            },
        (success) => {
              emit(state.copyWith(
                  getPersonTrendingMovies: success,
                  getPersonTrendingMoviesState: RequestStates.loaded))
            });
  }
}
