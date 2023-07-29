

import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/componts/get_now_playing_componts.dart';
import 'package:movie_db_bloc/movies/presentation/componts/loading_screen.dart';




class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
print('object');

    return BlocProvider(
      create: (context) => sl<MovieBloc>()..add(const GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc,MoviesStates>(
       builder: (context, state) {
         switch(state.getNowPlayingMoviesState){
           case RequestStates.loading:
             return const Center(child: CircularProgressIndicator(),);
           case RequestStates.loaded:
             return Scaffold(
               body: SingleChildScrollView(
                 key: const Key('movieScrollView'),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const GetNowPlayingMovieComponent(),
                     Container(
                       margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "Popular",
                             style: GoogleFonts.poppins(
                               fontSize: 19,
                               fontWeight: FontWeight.w500,
                               letterSpacing: 0.15,
                             ),
                           ),
                           InkWell(
                             onTap: () {
                               /// TODO : NAVIGATION TO POPULAR SCREEN
                             },
                             child: const Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Row(
                                 children: [
                                   Text('See More'),
                                   Icon(
                                     Icons.arrow_forward_ios,
                                     size: 16.0,
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                     FadeIn(
                       duration: const Duration(milliseconds: 500),
                       child: SizedBox(
                         height: 170.0,
                         child: ListView.builder(
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
                           itemCount: moviesList.length,
                           itemBuilder: (context, index) {
                             final movie = moviesList[index];
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
                     ),
                     Container(
                       margin: const EdgeInsets.fromLTRB(
                         16.0,
                         24.0,
                         16.0,
                         8.0,
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "Top Rated",
                             style: GoogleFonts.poppins(
                               fontSize: 19,
                               fontWeight: FontWeight.w500,
                               letterSpacing: 0.15,
                             ),
                           ),
                           InkWell(
                             onTap: () {
                               /// TODO : NAVIGATION TO Top Rated Movies Screen
                             },
                             child: const Padding(
                               padding: EdgeInsets.all(8.0),
                               child: Row(
                                 children: [
                                   Text('See More'),
                                   Icon(
                                     Icons.arrow_forward_ios,
                                     size: 16.0,
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                     FadeIn(
                       duration: const Duration(milliseconds: 500),
                       child: SizedBox(
                         height: 170.0,
                         child: ListView.builder(
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
                           itemCount: moviesList.length,
                           itemBuilder: (context, index) {
                             final movie = moviesList[index];
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
                     ),
                     const SizedBox(height: 50.0),
                   ],
                 ),
               ),
             );
           case RequestStates.error:
             return const Text('data');

         }

       },
      ),
    );
  }
}
