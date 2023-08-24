
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/utiles/app_string.dart';

class HeadLineMovieTitle extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const HeadLineMovieTitle({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return                      Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap:onTap,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(AppString.kSeeMore),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    )
    ;
  }
}
