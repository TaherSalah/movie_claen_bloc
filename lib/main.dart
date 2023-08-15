import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/movies/presentation/screens/movies_screen.dart';
import 'package:movie_db_bloc/movies/presentation/screens/splash_screen.dart';

import 'auth/Screens/Welcome/welcome_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),

      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies DB',
          theme: ThemeData(
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
