import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_states.dart';
import 'package:movie_db/movies/presentation/screens/movie_details.dart';


class GetNowPlayingMovieComponent extends StatelessWidget {
  const GetNowPlayingMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      ///*** for two rebuild to widget ***///
      buildWhen: (previous, current) =>
          previous.getNowPlayingMoviesState != current.getNowPlayingMoviesState,
      builder: (context, state) {

        switch (state.getNowPlayingMoviesState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.getNowPlayingMovies.map(
                  (item) {
                    return GestureDetector(
                      key: const Key('openMovieMinimalDetail'),
                      onTap: () {
                        // / TODO : NAVIGATE TO MOVIE DETAILS
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(id: item.id),
                            ));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  // fromLTRB
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0, 0.3, 0.5, 1],
                              ).createShader(
                                Rect.fromLTRB(0, 0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(

                              height: 560.0,
                              imageUrl:
                                  ApiConstance.imageUrl(item.backdropPath),
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>    Lottie.asset(
                                  "assets/images/not_found.json"),
                            ),
                            ),

                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(25),
                                    color: Colors.black.withOpacity(0.4),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.online_prediction,
                                                color: Colors.green),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              'Now Playing'.toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h,),
                                        Text(
                                          item.title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          case RequestStates.error:
            return Text('errrrrrrrrrrrrrrrrrrrrrrrrrror${RequestStates.error}');
        }
      },
    );
  }
}
