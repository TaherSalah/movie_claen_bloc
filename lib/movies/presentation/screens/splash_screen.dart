





import 'dart:async';

import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/componts/custom_widget/custom_splash_builder.dart';
import 'package:movie_db_bloc/movies/presentation/screens/movies_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 6),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MoviesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SplashItemBuilder(),
    );
  }
}