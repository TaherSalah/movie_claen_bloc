

import 'package:movie_db_bloc/core/exports/exports_files.dart';

class MovieBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;

  MovieBloc(this.getNowPlayingMovieUseCase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {

      final res =
          await GetNowPlayingMovieUseCase(sl()).execute();
      print(res);

      /////*** for change the state error and success ***////

      res.fold(
          (failure) => {
                emit(MoviesStates(
                  getNowPlayingMoviesState: RequestStates.error,

                  message: failure.message,
                ))
              },
          (success) => {
                emit(MoviesStates(
                  getNowPlayingMoviesState: RequestStates.loaded,
                  getNowPlayingMovies: success,
                ))

              });
    });
  }
}
