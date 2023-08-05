import 'dart:async';

import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_person_movie_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_tv_trending_movie_use_case.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  final GetTvTrendingMovieUseCase getTvTrendingMovieUseCase;

  MovieBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase, this.getTvTrendingMovieUseCase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_GetNowPlayingMoviesEvent);
    on<GetPopularMoviesEvent>(_GetPopularMoviesEvent);
    on<GetTopRatedMoviesEvent>(_GetTopRatedMoviesEvent);
    on<GetTvTrendingMoviesEvent>(_GetTvTrendingMoviesEvent);
    on<GetPersonTrendingMoviesEvent>(_GetPersonTrendingMoviesEvent);
  }


  // ignore: non_constant_identifier_names
  FutureOr<void> _GetNowPlayingMoviesEvent(
      event, Emitter<MoviesStates> emit) async {
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
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> _GetPopularMoviesEvent(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
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
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> _GetTopRatedMoviesEvent(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
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
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> _GetTvTrendingMoviesEvent(
      GetTvTrendingMoviesEvent event, Emitter<MoviesStates> emit) async {
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
  }

  // ignore: non_constant_identifier_names
  FutureOr<void> _GetPersonTrendingMoviesEvent(
      GetPersonTrendingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final res = await GetPersonMovieUseCase(sl()).execute();
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
