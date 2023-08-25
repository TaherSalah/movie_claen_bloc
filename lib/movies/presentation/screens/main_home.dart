import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_db/movies/presentation/screens/movies_screen.dart';
import 'package:movie_db/movies/presentation/screens/setting_screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}
int current = 0;
List<Widget> screens=[
  const MoviesScreen(),
  const SettingsScreen()
];

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[current],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.amberAccent,
          selectedFontSize: 15.sp,
          onTap: (index) {
            setState(() {
              current = index;
            });
            print(index);
          },
          currentIndex: current,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.settings,
                ),
                label: 'settings'),
          ]),

    );
  }
}
