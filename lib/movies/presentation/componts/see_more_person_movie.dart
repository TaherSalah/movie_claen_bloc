import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/core/services/services_locator.dart';
import 'package:movie_db/core/utiles/enums.dart';
import 'package:movie_db/movies/presentation/componts/get_tv_trending_componts.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_bloc.dart';
import 'package:movie_db/movies/presentation/controller/movie_controller/movies_events.dart';
import 'package:movie_db/movies/presentation/screens/person_details_screen.dart';

import '../controller/movie_controller/movies_states.dart';

class PersonMovieSeeMore extends StatelessWidget {
  const PersonMovieSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieBloc>()..add(const GetPersonTrendingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MoviesStates>(
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
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('All Person Trending movies'),
                  ),
                  body: GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    itemCount: state.getPersonTrendingMovies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonDetailsScreen(
                                  state.getPersonTrendingMovies[index].id),
                            )),
                        child: Card(
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                        height: 150,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        imageUrl: ApiConstance.imageUrl(state
                                            .getPersonTrendingMovies[index]
                                            .profilePath),
                                        placeholder: (context, url) =>
                                            defShimmer(),
                                        errorWidget: (context, url, error) =>
                                            // LottieBuilder.asset('assets/images/not_found.json')
                                            const Icon(Icons.radar)),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          state.getPersonTrendingMovies[index]
                                              .originalName,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          state.getPersonTrendingMovies[index]
                                              .knownForDepartment,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
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
