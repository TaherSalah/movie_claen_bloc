
import 'package:movie_db_bloc/core/exports/exports_files.dart';
import 'package:movie_db_bloc/core/utiles/app_string.dart';

class SplashItemBuilder extends StatefulWidget {
  const SplashItemBuilder({super.key});

  @override
  State<SplashItemBuilder> createState() => _SplashItemBuilderState();
}

class _SplashItemBuilderState extends State<SplashItemBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: double.infinity.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                AppConstance.splashLogoImage,
                height: 400.0.h,
                width: 300.0.w,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                textAlign: TextAlign.center,
                AppString.kMovieSplash,
                style: GoogleFonts.cairo(
                    fontSize: 25.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
              child: CircularProgressIndicator(
                color: Colors.amberAccent,
                strokeWidth: 5.w,
              )),
        ],
      ),
    );
  }
}