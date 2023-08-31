





import 'dart:async';

import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/custom_splash_builder.dart';

import 'package:movie_db/movies/presentation/screens/main_screen.dart';

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
            MaterialPageRoute(builder: (context) => const MainHome())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: SplashItemBuilder(),
    );
  }
}