

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_states.dart';
import 'package:movie_db/movies/presentation/screens/person_details_screen.dart';

class GetPersonMovieComponent extends StatelessWidget {
  const GetPersonMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      ///*** for two rebuild to widget ***///

      buildWhen: (previous, current) =>
          previous.getPersonTrendingMoviesState !=
          current.getPersonTrendingMoviesState,
      builder: (context, state) {
        switch (state.getPersonTrendingMoviesState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 250.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.getPersonTrendingMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.getPersonTrendingMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PersonDetailsScreen(
                                    state.getPersonTrendingMovies[index].id),
                              ));
                        },
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  ApiConstance.imageUrl(movie.profilePath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: Lottie.asset(
                                    "assets/images/not_found.json"),
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestStates.error:
            return Text('errrrrrrrrrrrrrrrrrrrrrrrrrror${RequestStates.error}');
        }

      },

    );

  }
}
