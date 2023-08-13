import 'package:lottie/lottie.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/controller/movie_controller/movies_events.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NowPlayingSeeMore extends StatelessWidget {
  const NowPlayingSeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieBloc>()..add(const GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MoviesStates>(
        buildWhen: (previous, current) =>
            previous.getNowPlayingMoviesState !=
            current.getNowPlayingMoviesState,
        builder: (context, state) {
          print('seeeeeeeeeeeeeeeeeee ${state.getNowPlayingMovies}');

          switch (state.getNowPlayingMoviesState) {
            case RequestStates.loading:
              return const SizedBox(
                height: 170,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestStates.loaded:
              return Scaffold(
                  body: GridView.builder(
                    padding: EdgeInsets.symmetric(vertical: 15),
                itemCount: state.getNowPlayingMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(8.0)),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: ApiConstance.imageUrl(state
                                  .getNowPlayingMovies[index]
                                  .backdropPath),
                              placeholder: (context, url) => defShimmer(),
                              errorWidget: (context, url, error) =>
                                  // LottieBuilder.asset('assets/images/not_found.json')
                                  const Icon(Icons.radar)),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                          child: Text(
                            state.getNowPlayingMovies[index].title,
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                          child: Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 20.0,
                                lineWidth: 2.5,
                                animateFromLastPercent: true,
                                animation: true,
                                percent: double.parse(
                                    '${state.getNowPlayingMovies[index].voteAverage}') /
                                    9,
                                // here we're using the percentage to be in sync with the color of the text
                                center: Text(

                                  ("${(state.getNowPlayingMovies[index].voteAverage/9*100).round()}%"),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 10.0,color: Colors.black),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.green[700],
                              )

                            ],
                          ),
                        )
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
