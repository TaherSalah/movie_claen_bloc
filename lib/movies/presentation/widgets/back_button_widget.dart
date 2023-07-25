
import 'package:movie_db_bloc/core/exports/exports_files.dart';


class BackButtonWidget extends StatelessWidget {
  final  String? icon;
  final Color? backGroundColor,iconColor;
  final double? width, height;
  final void Function()? onTap;
  const BackButtonWidget(
      {Key? key,  this.icon, this.backGroundColor, this.height, this.width, this.onTap, this.iconColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ?? () => Navigator.of(context).maybePop(),
      child: Transform.scale(
        alignment: Alignment.center,
        scaleX: SharedPref.getCurrentLang() == 'ar' ? -1 : 1,
        child: Image.asset(
          icon ??"assets/images/arrow-left.svg",
          color: iconColor ?? ThemeClass.blackColor,
          height: height ?? 24.h,
          width: width ?? 24.h,
        ),
      ),
    );
  }
}
