
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_states.dart';

import '../screens/movie_details.dart';



class GetTvTrendingMovieComponent extends StatelessWidget {
  const GetTvTrendingMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MoviesStates>(
      ///*** for two rebuild to widget ***///
      buildWhen: (previous, current) =>
          previous.getTvTrendingMoviesState != current.getTvTrendingMoviesState,
      builder: (context, state) {
        switch (state.getTvTrendingMoviesState) {
          case RequestStates.loading:
            return const SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestStates.loaded:
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final movie = state.getTvTrendingMovies[index];
                  return InkWell(
                    onTap: () {
                      /// TODO : NAVIGATE TO  MOVIE DETAILS
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MovieDetailScreen(id: movie.id),
                          ));

                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                        placeholder: (context, url) => defShimmer(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              ),
            );
          case RequestStates.error:
            return Text('errrrrrrrrrrrrrrrrrrrrrrrrrror${RequestStates.error}');
        }
      },
    );
  }
}

Widget defShimmer() {
  return Shimmer.fromColors(
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
  );
}
