import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_states.dart';
import 'package:movie_db/movies/presentation/screens/movie_details.dart';
import 'package:shimmer/shimmer.dart';

class GetPopularMovieComponent extends StatelessWidget {
  const GetPopularMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      ///*** for two rebuild to widget ***///

      buildWhen: (previous, current) =>
          previous.getPopularMoviesState != current.getPopularMoviesState,
      builder: (context, state) {
        switch (state.getPopularMoviesState) {
          case RequestStates.loading:
            return const SizedBox(
              height: 170,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    final movie = state.getPopularMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(id: movie.id)
                              ));
                        },
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
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
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
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
