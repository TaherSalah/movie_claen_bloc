import 'package:get_it/get_it.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_tv_trending_movie_use_case.dart';

/////***  create new instance from get it package  ***/////
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /////***  New object from Movie Bloc  ***/////

    sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl()));

    /////***  New object from Use Case  ***/////

    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => MovieRemoteDataSource());
    /////***  New object from  Base Movie Repository  ***/////
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /////*** New object  Get Now Playing Movie Use Case  ***/////
    sl.registerLazySingleton<GetNowPlayingMovieUseCase>(
        () => GetNowPlayingMovieUseCase(sl()));
    sl.registerLazySingleton<GetPopularMovieUseCase>(
        () => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMovieUseCase>(
        () => GetTopRatedMovieUseCase(sl()));
    sl.registerLazySingleton<GetTvTrendingMovieUseCase>(
        () => GetTvTrendingMovieUseCase(sl()));
  }
}
