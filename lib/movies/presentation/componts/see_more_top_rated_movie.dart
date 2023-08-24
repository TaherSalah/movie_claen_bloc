
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/services/services_locator.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/componts/get_tv_trending_componts.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_events.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_states.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TopRatedSeeMore extends StatelessWidget {
  const TopRatedSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MovieBloc>()..add(const GetTopRatedMoviesEvent()),
      child: BlocBuilder<MovieBloc, MoviesStates>(
        buildWhen: (previous, current) =>
            previous.getTopRatedMoviesState != current.getTopRatedMoviesState,
        builder: (context, state) {
          switch (state.getTopRatedMoviesState) {
            case RequestStates.loading:
              return const SizedBox(
                height: 170,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestStates.loaded:
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('All Top Rated movies'),
                  ),
                  body: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemCount: state.getTopRatedMovies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: ApiConstance.imageUrl(state
                                          .getTopRatedMovies[index]
                                          .backdropPath),
                                      placeholder: (context, url) =>
                                          defShimmer(),
                                      errorWidget: (context, url, error) =>
                                          // LottieBuilder.asset('assets/images/not_found.json')
                                          const Icon(Icons.radar)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    state.getTopRatedMovies[index].title,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 14.r,
                                        lineWidth: 2.5,
                                        animateFromLastPercent: true,
                                        animation: true,
                                        percent: double.parse(
                                                '${state.getTopRatedMovies[index].voteAverage}') /
                                            9,
                                        // here we're using the percentage to be in sync with the color of the text
                                        center: Text(
                                          ("${(state.getTopRatedMovies[index].voteAverage / 9 * 100).round()}%"),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.0.sp,
                                              color: Colors.black),
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: Colors.green[700],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'User\nscore',
                                        style: TextStyle(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 2.0,
                                          horizontal: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        child: Text(
                                          state.getTopRatedMovies[index]
                                              .releaseDate
                                              .split('-')[0],
                                          style: const TextStyle(
                                            fontSize: 9.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },

                  ));
            case RequestStates.error:
              return const Text('eeeeeeeeeeeeeeeeeeeeeeeerrror');
          }
        },
      ),
    );
  }
}
