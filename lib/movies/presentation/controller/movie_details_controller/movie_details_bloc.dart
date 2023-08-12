import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/entities/movie_details.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';




class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
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
}
