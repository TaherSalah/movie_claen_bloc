import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/services/services_locator.dart';
import 'package:movie_db/core/utiles/app_string.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/custom_head_line_movie_title.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/see_more_tv_trending_movie.dart';
import 'package:movie_db/movies/presentation/componts/get_now_playing_componts.dart';
import 'package:movie_db/movies/presentation/componts/get_person_componts.dart';
import 'package:movie_db/movies/presentation/componts/get_popular_componts.dart';
import 'package:movie_db/movies/presentation/componts/get_top_rated_componts.dart';
import 'package:movie_db/movies/presentation/componts/get_tv_trending_componts.dart';
import 'package:movie_db/movies/presentation/componts/see_more_person_movie.dart';
import 'package:movie_db/movies/presentation/componts/see_more_popular_movie.dart';
import 'package:movie_db/movies/presentation/componts/see_more_top_rated_movie.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/screens/about_screen.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';

import '../controller/movie_controller/movies_events.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<MovieBloc>()
          ..add(const GetNowPlayingMoviesEvent())
          ..add(const GetPopularMoviesEvent())
          ..add(const GetTopRatedMoviesEvent())
          ..add(const GetTvTrendingMoviesEvent())
          ..add(const GetPersonTrendingMoviesEvent()),
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen(),));
                },
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/images/splashImage.png',
                      height: 50,
                      width: 40,
                    )),
              ),
              actions: [
                IconButton(
                    onPressed: () async {
                      await logOut(context);
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopRatedSeeMore(),
                          ));
                    },
                  ),
                  const GetTopRatedMovieComponent(),
                  HeadLineMovieTitle(
                    title: AppString.kTvTrending,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TvTrendingSeeMore(),
                          ));
                    },
                  ),
                  const GetTvTrendingMovieComponent(),
                  HeadLineMovieTitle(
                    title: AppString.kPersonTrending,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PersonMovieSeeMore(),
                          ));
                    },
                  ),
                  const GetPersonMovieComponent()
                ],
              ),
            ),
          ),
        ));
  }
}

logOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
}
