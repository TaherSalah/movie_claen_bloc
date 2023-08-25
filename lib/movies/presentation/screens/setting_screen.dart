import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db/movies/presentation/screens/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AboutItemBuilder();
  }
}

class AboutItemBuilder extends StatefulWidget {
  const AboutItemBuilder({super.key});

  @override
  State<AboutItemBuilder> createState() => _AboutItemBuilderState();
}

class _AboutItemBuilderState extends State<AboutItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7FFE5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset(
                'assets/images/splashImage.png',
                height: 150.h,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copyright_sharp, size: 20.sp),
              Text(
                'All Rights Reserved by Dev Taher Salah \u{1f60e}',
                style: GoogleFonts.merienda(fontSize: 10.sp),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),

                InkWell(
                  onTap: () async{
                   await FirebaseAuth.instance.signOut();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.login_outlined),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Logout',
                          style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold, fontSize: 16.sp),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: Image.asset(
                      'assets/images/perLogo.png',
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
