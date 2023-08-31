import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/services/services_locator.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';
import 'package:movie_db/movies/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance();
  ServicesLocator().init();
  runApp(const MyApp());
}

bool? isLogin;
var user = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
          home: user == null ? const LoginScreen() : const SplashScreen(),
        );
      },
    );
  }
}
