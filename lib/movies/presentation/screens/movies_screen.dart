import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_now_playing_componts.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_popular_componts.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_top_rated_componts.dart';
import 'package:movie_db_bloc/movies/presentation/componts/head_line_movie_title.dart';
import 'package:movie_db_bloc/movies/presentation/componts/loading_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('object');

    return BlocProvider(
      create: (context) =>
          sl<MovieBloc>()..add(const GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MoviesStates>(
        builder: (context, state) {
          switch (state.getNowPlayingMoviesState) {
            case RequestStates.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestStates.loaded:
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
                      const SizedBox(height: 50.0),
                    ],
                  ),
                ),
              );
            case RequestStates.error:
              return  Text('errrrrrrrrrrrrrrrrrrrrrrrrrror${RequestStates.error}');
          }
        },
      ),
    );
  }
}
