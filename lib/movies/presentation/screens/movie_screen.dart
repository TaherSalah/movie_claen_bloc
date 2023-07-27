import 'package:movie_db_bloc/movies/data/data_sources/remote_data_source/movie_remote_data_source.dart';
import 'package:movie_db_bloc/movies/data/repositories/movie_repository.dart';
import 'package:movie_db_bloc/movies/domain/use_cases/get_now_playing_movie_use_case.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/exports/exports_files.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

List<Movie> movies = [];

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseRemoteMovieDataSource baseRemoteMovieDataSource =
        MovieRemoteDataSource();
    BaseMovieRepository baseMovieRepository =
        MovieRepository(baseRemoteMovieDataSource);
    final res = await GetNowPlayingMovieUseCase(baseMovieRepository).execute();
    // print(res);
    res.fold((l) => null, (r) {
      setState(() {
        movies = r;
        print('success fetch data $movies');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Center(
          child: ElevatedButton(onPressed: () async {
            setState(() {
              SignInWithAppleButton(
                onPressed: () async {
                  final credential = await SignInWithApple.getAppleIDCredential(
                    scopes: [
                      AppleIDAuthorizationScopes.email,
                      AppleIDAuthorizationScopes.fullName,
                    ],
                  );

                  print(credential);

                  // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
                  // after they have been validated with Apple (see `Integration` section for more information on how to do this)
                },
              );

            });
          }, child: Text('google')),
        )
    );
  }
}
