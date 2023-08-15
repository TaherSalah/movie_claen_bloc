import 'package:lottie/lottie.dart';
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/componts/custom_widget/custom_expansion_tile.dart';
import 'package:movie_db_bloc/movies/presentation/componts/custom_widget/custom_text_default_widget.dart';

class PersonDetailsScreen extends StatefulWidget {
  final int id;

  const PersonDetailsScreen(this.id, {super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<MovieDetailsBloc>()..add(GetMoviePersonDetailsEvent(widget.id)),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (BuildContext context, state) {
          switch (state.moviePersonState) {
            case RequestStates.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestStates.loaded:
              bool isExpanded = false;
              return Scaffold(
                body: CustomScrollView(
                  key: const Key('movieDetailScrollView'),
                  slivers: [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: 350.h,
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
                              Text('${state.moviePerson?.name}',
                                  style: GoogleFonts.poppins(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
                              const SizedBox(height: 8.0),
                              Text(
                                '${state.moviePerson?.birthday}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Text(
                                '${state.moviePerson?.placeOfBirth}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 30.h,),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: isExpanded == true
                                        ? ThemeClass.primaryColor
                                            .withOpacity(.1)
                                        : ThemeClass.greyLightColor),
                                child: ExpansionTile(
                                  backgroundColor: ThemeClass.greyLightColor,
                                  subtitle: const Text('Actor Biography '),
                                  iconColor: ThemeClass.blackColor,
                                  title: TextDefaultWidget(
                                    title: 'Biography',
                                    height: 3,
                                    color: ThemeClass.blueColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                  children: [
                                    Text(
                                      '${state.moviePerson?.biography}',
                                      style: const TextStyle(height: 2),
                                    )
                                  ],
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      isExpanded = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
