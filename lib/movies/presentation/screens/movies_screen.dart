import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/utiles/app_string.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_person_componts.dart';
import 'package:movie_db_bloc/movies/presentation/componts/see_more_now_playing_movie.dart';

import '../controller/movie_controller/movies_events.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieBloc>()
          ..add(const GetNowPlayingMoviesEvent())
          ..add(const GetPopularMoviesEvent())
          ..add(const GetTopRatedMoviesEvent())
          ..add(const GetTvTrendingMoviesEvent())
          ..add(const GetPersonTrendingMoviesEvent()),
        child: Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetNowPlayingMovieComponent(),
                HeadLineMovieTitle(
                  title: AppString.kPopular,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NowPlayingSeeMore(),
                        ));
                  },
                ),
                const GetPopularMovieComponent(),
                HeadLineMovieTitle(
                  title: AppString.kTopRated,
                  onTap: () {},
                ),
                const GetTopRatedMovieComponent(),
                HeadLineMovieTitle(
                  title: AppString.kTvTrending,
                  onTap: () {},
                ),
                const GetTvTrendingMovieComponent(),
                HeadLineMovieTitle(
                  title: AppString.kPersonTrending,
                  onTap: () {},
                ),
                const GetPersonMovieComponent()
              ],
            ),
          ),
        ));
  }
}
