import 'package:lottie/lottie.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';

class PersonDetailsScreen extends StatelessWidget {
  final int id;

  const PersonDetailsScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<MovieDetailsBloc>()..add(GetMoviePersonDetailsEvent(id)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (BuildContext context, state) {
          switch (state.moviePersonState) {
            case RequestStates.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestStates.loaded:
              return Scaffold(
                body: CustomScrollView(
                  key: const Key('movieDetailScrollView'),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        background: FadeIn(
                          duration: const Duration(milliseconds: 500),
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent,
                                ],
                                stops: [0.0, 0.5, 1.0, 1.0],
                              ).createShader(
                                Rect.fromLTRB(
                                    0.0, 0.0, rect.width, rect.height),
                              );
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                              width: MediaQuery.of(context).size.width,
                              imageUrl: ApiConstance.imageUrl(
                                  '${state.moviePerson?.profilePath}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text('${state.moviePerson?.birthday}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
                              const SizedBox(height: 8.0),
                              Row(
                                children: [
                                  // Container(
                                  //   padding: const EdgeInsets.symmetric(
                                  //     vertical: 2.0,
                                  //     horizontal: 8.0,
                                  //   ),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.grey[800],
                                  //     borderRadius: BorderRadius.circular(
                                  //         4.0),
                                  //   ),
                                  //   child: Text(
                                  //     state.movieDetails!.releaseDate.split(
                                  //         '-')[0],
                                  //     style: const TextStyle(
                                  //       fontSize: 16.0,
                                  //       fontWeight: FontWeight.w500,
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(width: 16.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '${state.moviePerson?.name}',
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '(${state.moviePerson?.knownForDepartment})',
                                        style: const TextStyle(
                                          fontSize: 1.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                '${state.moviePerson?.biography}',
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              // Text(
                              //   'Genres: ${_showGenres(
                              //       state.movieDetails!.genres)}',
                              //   style: const TextStyle(
                              //     color: Colors.white70,
                              //     fontSize: 12.0,
                              //     fontWeight: FontWeight.w500,
                              //     letterSpacing: 1.2,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding:
                          const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                      sliver: SliverToBoxAdapter(
                        child: FadeInUp(
                          from: 20,
                          duration: const Duration(milliseconds: 500),
                          child: Text(
                            'More like this'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Tab(text: 'More like this'.toUpperCase()),
                    // SliverPadding(
                    //   padding: const EdgeInsets.fromLTRB(
                    //       16.0, 0.0, 16.0, 24.0),
                    //   sliver: _showRecommendations(),
                    // ),
                  ],
                ),
              );

            case RequestStates.error:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}

// class SliverBuilder extends StatelessWidget {
//   const SliverBuilder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       key: const Key('movieDetailScrollView'),
//       slivers: [
//         SliverAppBar(
//           pinned: true,
//           expandedHeight: 250.0,
//           flexibleSpace: FlexibleSpaceBar(
//             background: FadeIn(
//               duration: const Duration(milliseconds: 500),
//               child: ShaderMask(
//                 shaderCallback: (rect) {
//                   return const LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.transparent,
//                       Colors.black,
//                       Colors.black,
//                       Colors.transparent,
//                     ],
//                     stops: [0.0, 0.5, 1.0, 1.0],
//                   ).createShader(
//                     Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
//                   );
//                 },
//                 blendMode: BlendMode.dstIn,
//                 child: CachedNetworkImage(
//                   width: MediaQuery.of(context).size.width,
//                   imageUrl: ApiConstance.imageUrl(
//                       state.movieDetails!.backdropPath!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SliverToBoxAdapter(
//           child: FadeInUp(
//             from: 20,
//             duration: const Duration(milliseconds: 500),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(state.movieDetails!.title,
//                       style: GoogleFonts.poppins(
//                         fontSize: 23,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: 1.2,
//                       )),
//                   const SizedBox(height: 8.0),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 2.0,
//                           horizontal: 8.0,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[800],
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         child: Text(
//                           state.movieDetails!.releaseDate.split('-')[0],
//                           style: const TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 16.0),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                             size: 20.0,
//                           ),
//                           const SizedBox(width: 4.0),
//                           Text(
//                             (state.movieDetails!.voteAverage / 2)
//                                 .toStringAsFixed(1),
//                             style: const TextStyle(
//                               fontSize: 16.0,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                           const SizedBox(width: 4.0),
//                           Text(
//                             '(${state.movieDetails!.voteAverage})',
//                             style: const TextStyle(
//                               fontSize: 1.0,
//                               fontWeight: FontWeight.w500,
//                               letterSpacing: 1.2,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 16.0),
//                       Text(
//                         _showDuration(state.movieDetails!.runtime),
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20.0),
//                   Text(
//                     state.movieDetails!.overview,
//                     style: const TextStyle(
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     'Genres: ${_showGenres(state.movieDetails!.genres)}',
//                     style: const TextStyle(
//                       color: Colors.white70,
//                       fontSize: 12.0,
//                       fontWeight: FontWeight.w500,
//                       letterSpacing: 1.2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
//           sliver: SliverToBoxAdapter(
//             child: FadeInUp(
//               from: 20,
//               duration: const Duration(milliseconds: 500),
//               child: Text(
//                 'More like this'.toUpperCase(),
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w500,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//             ),
//           ),
//         ),
//         // Tab(text: 'More like this'.toUpperCase()),
//         SliverPadding(
//           padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
//           sliver: _showRecommendations(),
//         ),
//       ],
//     );
//
//   }
// }

// Column
// (
// children: [
// CachedNetworkImage(
// imageUrl: ApiConstance.imageUrl(ApiConstance.imageUrl(
// "${state.moviePerson?.profilePath}")),
// placeholder: (context, url) => Shimmer.fromColors(
// baseColor: Colors.grey[850]!,
// highlightColor: Colors.grey[800]!,
// child: Container(
// height: MediaQuery.of(context).size.width,
// width: MediaQuery.of(context).size.width,
// decoration: BoxDecoration(
// color: Colors.black,
// borderRadius: BorderRadius.circular(8.0),
// ),
// ),
// ),
// errorWidget: (context, url, error) => Lottie.asset(
// 'assets/images/image_error.json',
// height: MediaQuery.of(context).size.width,
// width: MediaQuery.of(context).size.width,
// ),
// fit: BoxFit.cover,
// ),
// Text(
// '${state.moviePerson?.name}',
// style: TextStyle(
// fontSize: 25.sp, fontWeight: FontWeight.bold),
// )
// ],
// ),
