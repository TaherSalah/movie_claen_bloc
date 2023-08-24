import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/domain/entities/movie_details.dart';
import 'package:movie_db/movies/domain/entities/person_details.dart';
import 'package:movie_db/movies/domain/entities/recommendations.dart';
import 'package:movie_db/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db/movies/domain/use_cases/get_person_details_use_case.dart';
import 'package:movie_db/movies/domain/use_cases/get_recommendations_movie_use_case.dart';


part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendationsMovieUseCase getRecommendationsMovieUseCase;
  GetPersonDetailsUseCase getPersonDetailsUseCaseMovieUseCase;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase,
      this.getRecommendationsMovieUseCase,
      this.getPersonDetailsUseCaseMovieUseCase)
      : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendationMovie);
    on<GetMoviePersonDetailsEvent>(_getPersonDetailsMovie);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final res =
        await getMovieDetailsUseCase.call(MovieDetailsPrams(id: event.id));
    res.fold(
        (failure) => emit(state.copyWith(
            movieDetailsState: RequestStates.error,
            movieMessage: failure.message)),
        (success) => emit(state.copyWith(
              movieDetails: success,
              movieDetailsState: RequestStates.loaded,
            )));
  }

  FutureOr<void> _getRecommendationMovie(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final res = await getRecommendationsMovieUseCase
        .call(RecommendationsParameters(event.id));
    res.fold(
        (failure) => emit(state.copyWith(
              movieRecommendationState: RequestStates.error,
              movieRecommendationMessage: failure.message,
            )),
        (success) => emit(state.copyWith(
            movieRecommendation: success,
            movieRecommendationState: RequestStates.loaded)));
  }

  FutureOr<void> _getPersonDetailsMovie(
      GetMoviePersonDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final res = await getPersonDetailsUseCaseMovieUseCase
        .call(PersonDetailsPrams(id: event.id));
    res.fold(
        (failure) => emit(state.copyWith(
              moviePersonState: RequestStates.error,
              moviePersonMessage: failure.message,
            )),
        (success) => emit(state.copyWith(
            moviePerson: success, moviePersonState: RequestStates.loaded)));
  }
}
