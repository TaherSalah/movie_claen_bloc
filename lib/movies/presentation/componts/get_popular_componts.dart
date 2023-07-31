import 'dart:developer';

import 'package:movie_db_bloc/core/exports/exports_files.dart';

class GetPopularMovieComponent extends StatelessWidget {
  const GetPopularMovieComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MoviesStates>(
      builder: (context, state) {
        log(state.toString());

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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.getPopularMovies.length,
              itemBuilder: (context, index) {
                final movie = state.getPopularMovies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      /// TODO : NAVIGATE TO  MOVIE DETAILS
                    },
                    child: ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl:
                        ApiConstance.imageUrl(movie.backdropPath),
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
