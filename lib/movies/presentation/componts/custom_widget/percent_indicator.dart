import 'package:movie_db/core/exports/exports_files.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: must_be_immutable
class PercentIndicator extends StatelessWidget {
   double? radius = 10;
   double? lineWidth = 2;
   double? percent = 2;
   double? voteAverage = 2;
   String? text = '';


  PercentIndicator(
      {super.key, this.radius, this.lineWidth, this.percent, this.voteAverage, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: CircularPercentIndicator(
          radius: radius!,
          lineWidth: lineWidth!,
          animateFromLastPercent: true,
          animation: true,
          percent: percent!,
          // here we're using the percentage to be in sync with the color of the text
          center: Text(
            text!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 5.sp,
                color: Colors.white),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.green[700],
        ));
  }
}
