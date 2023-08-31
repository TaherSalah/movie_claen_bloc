import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AboutItemBuilder(),
    );
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          Text('Version 1.0.0',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey)),
          SizedBox(
            height: 7.h,
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
                Row(
                  children: [
                    Expanded(child: myDivider()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'App About',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold, fontSize: 15.sp),
                      ),
                    ),
                    Expanded(child: myDivider()),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  selectionColor: Colors.amber,
                 ' movies, TV shows and people to discover. Explore now',
                  style: GoogleFonts.notoKufiArabic(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(child: myDivider()),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'App Rate',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                    ),
                    Expanded(child: myDivider()),
                  ],
                ),
                const RetBar(),

                Row(
                  children: [
                    Expanded(child: myDivider()),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Develop By',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Expanded(child: myDivider()),
                  ],
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


Widget myDivider() => Container(
  width: double.infinity,
  height: 2.0,
  color: Colors.grey[300],
);


class RetBar extends StatelessWidget {
  const RetBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding:  EdgeInsets.symmetric(horizontal: 4.0.w),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}