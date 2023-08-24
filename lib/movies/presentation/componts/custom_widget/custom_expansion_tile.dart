
import 'package:movie_db/core/Theme/theme.dart';
import 'package:movie_db/core/exports/exports_files.dart';
import 'package:movie_db/movies/presentation/componts/custom_widget/custom_text_default_widget.dart';

// ignore: must_be_immutable
class CustomExpansionTile extends StatefulWidget {

  final String title;

  final Widget content;
  bool isExpanded = false;

  CustomExpansionTile(this.title, this.content, this.isExpanded, {super.key});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {





  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      iconColor: ThemeClass.blackColor,

      title: TextDefaultWidget(
        title: widget.title,
        color: ThemeClass.blackColor,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: widget.content),
        SizedBox(height: 20.h)
      ],
      onExpansionChanged: (value) {
        setState(() {
          widget.isExpanded = value;
        });
      },
    );
  }
}
