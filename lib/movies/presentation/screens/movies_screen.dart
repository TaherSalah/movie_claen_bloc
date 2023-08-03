import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_tv_trending_componts.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieBloc>()
          ..add(const GetNowPlayingMoviesEvent())
          ..add(const GetPopularMoviesEvent())
          ..add(const GetTopRatedMoviesEvent())
          ..add(const GetTvTrendingMoviesEvent()),
        child: BlocBuilder<MovieBloc, MoviesStates>(builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GetNowPlayingMovieComponent(),
                  HeadLineMovieTitle(
                    title: 'Popular',
                    onTap: () {},
                  ),
                  const GetPopularMovieComponent(),
                  HeadLineMovieTitle(
                    title: 'Top Rated',
                    onTap: () {},
                  ),
                  const GetTopRatedMovieComponent(),
                  HeadLineMovieTitle(
                    title: 'Tv Trending',
                    onTap: () {},
                  ),
                  const GetTvTrendingMovieComponent()
                ],
              ),
            ),
          );
        }));
  }
}
