import 'package:lottie/lottie.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/core/utiles/app_constanc.dart';

class CustomNetworkCachedImage extends StatelessWidget {
  final String url;

  const CustomNetworkCachedImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Lottie.asset(
        AppConstance.errorNetWorkImage,
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
      ),
      height: 180.0,
      fit: BoxFit.cover,
    );
  }
}
