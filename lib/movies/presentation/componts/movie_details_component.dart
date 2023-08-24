import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/network/api_constanc.dart';
import 'package:movie_db/movies/domain/entities/genres.dart';

class MovieDetailContent extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? releaseDate;
  final double? voteAverage;
  final String? showDuration;
  final String? overview;
  final String? genres;
  final Widget? sliver;

  const MovieDetailContent(
      this.imageUrl,
      this.title,
      this.releaseDate,
      this.voteAverage,
      this.showDuration,
      this.overview,
      this.genres,
      this.sliver,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                    Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: ApiConstance.imageUrl(imageUrl!),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title!,
                      style: GoogleFonts.cairo(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      )),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          releaseDate!.split('-')[0],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            (voteAverage! / 2).toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          // Text(
                          //   '(${state.movieDetails!.voteAverage})',
                          //   style: const TextStyle(
                          //     fontSize: 1.0,
                          //     fontWeight: FontWeight.w500,
                          //     letterSpacing: 1.2,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        showDuration!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    overview!,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Genres: $genres',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
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
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: sliver,
        ),
      ],
    );
  }
}

Widget showRecommendations(
    { String? imageUrl, required int childCount, required Widget errorImage}) {
  return SliverGrid(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            child: CachedNetworkImage(
              imageUrl: ApiConstance.imageUrl(imageUrl!),
              placeholder: (context, url) => const ShimmerWidget(),
              errorWidget: (context, url, error) => errorImage,
              height: 180.0,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      childCount: childCount,
    ),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      childAspectRatio: 0.7,
      crossAxisCount: 3,
    ),
  );
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}

String showGenres(List<Genres> genres) {
  String result = '';
  for (var genre in genres) {
    result += '${genre.name}, ';
  }

  if (result.isEmpty) {
    return result;
  }

  return result.substring(0, result.length - 2);
}

String showDuration(int runtime) {
  final int hours = runtime ~/ 60;
  final int minutes = runtime % 60;

  if (hours > 0) {
    return '${hours}h ${minutes}m';
  } else {
    return '${minutes}m';
  }
}
