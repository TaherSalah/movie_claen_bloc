import 'package:get_it/get_it.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_person_details_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_person_movie_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_recommendations_movie_use_case.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_tv_trending_movie_use_case.dart';
import 'package:movie_db_bloc/movies/presentation/controller/movie_details_controller/movie_details_bloc.dart';

/////***  create new instance from get it package  ***/////
final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /////***  New object from Movie Bloc  ***/////
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl(), sl()));
    /////***  New object from Movie Details Bloc  ***/////
    sl.registerFactory(() => MovieDetailsBloc(sl(), sl(), sl()));
    /////***  New object from Base Remote Movie Data Source  ***/////
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => MovieRemoteDataSource());
    /////***  New object from  Base Movie Repository  ***/////
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    /////*** New object  Get Now Playing Movie Use Case  ***/////
    sl.registerLazySingleton<GetNowPlayingMovieUseCase>(
        () => GetNowPlayingMovieUseCase(sl()));
    /////*** New object  Get Popular Movie Use Case  ***/////
    sl.registerLazySingleton<GetPopularMovieUseCase>(
        () => GetPopularMovieUseCase(sl()));
    /////*** New object  Get TopRated Movie Use Case  ***/////
    sl.registerLazySingleton<GetTopRatedMovieUseCase>(
        () => GetTopRatedMovieUseCase(sl()));
    /////*** New object  Get TvTrending Movie Use Case  ***/////
    sl.registerLazySingleton<GetTvTrendingMovieUseCase>(
        () => GetTvTrendingMovieUseCase(sl()));
    /////*** New object  Get Person Movie Use Case  ***/////
    sl.registerLazySingleton<GetPersonMovieUseCase>(
        () => GetPersonMovieUseCase(sl()));
    /////*** New object  Get MovieDetails Movie Use Case  ***/////
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));
    /////*** New object  Get Recommendations Movie Use Case  ***/////
    sl.registerLazySingleton<GetRecommendationsMovieUseCase>(
        () => GetRecommendationsMovieUseCase(sl()));
    /////*** New object  Get Person Details Movie Use Case  ***/////
    sl.registerLazySingleton<GetPersonDetailsUseCase>(
        () => GetPersonDetailsUseCase(sl()));
  }
}
