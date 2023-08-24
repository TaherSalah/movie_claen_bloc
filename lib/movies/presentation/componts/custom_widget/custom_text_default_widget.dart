
import 'package:movie_db/core/Theme/theme.dart';
import 'package:movie_db/core/exports/exports_files.dart';

class TextDefaultWidget extends StatelessWidget {
  const TextDefaultWidget({Key? key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    // ignore: non_constant_identifier_names
    this.FontFamily,
    this.color,
    this.gradientColors,
    this.maxLines,
    this.height,
    this.underlineText, this.textBaseline, this.textAlign, this.textOverflow,})
      : super(key: key);
  final double? fontSize;
  final FontWeight? fontWeight;
  // ignore: non_constant_identifier_names
  final String? FontFamily;
  final Color? color;
  final Paint? gradientColors;
  final String title;
  final int? maxLines;
  final bool? underlineText;
  final TextBaseline? textBaseline;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double?height;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          height: height,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? ThemeClass.whiteColor,
          textBaseline: textBaseline,
          fontFamily: FontFamily ?? "Almarai",
          foreground: gradientColors,
          overflow: textOverflow ?? TextOverflow.ellipsis,

          decoration: underlineText == true
              ? TextDecoration.underline
              : TextDecoration.none),
      maxLines: maxLines ?? 5,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
