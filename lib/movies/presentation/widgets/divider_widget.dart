

import 'package:movie_db_bloc/core/exports/exports_files.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 136.w,
      height: 1.h,
      decoration: BoxDecoration(
          color: ThemeClass.normalgreyColor,
          borderRadius: BorderRadius.circular(8.r)),
    );
  }
}
