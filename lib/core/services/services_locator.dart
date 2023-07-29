import 'package:get_it/get_it.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';

/////***  create new instance from get it package  ***/////
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /////***  New object from Use Case  ***/////

    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => MovieRemoteDataSource());
    /////***  New object from  Base Movie Repository  ***/////
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /////*** New object  Get Now Playing Movie Use Case  ***/////
    sl.registerLazySingleton<GetNowPlayingMovieUseCase>(
        () => GetNowPlayingMovieUseCase(sl()));
  }
}
