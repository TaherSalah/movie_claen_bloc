import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schoopedia_app/Shared/shared_preferances.dart';
import 'package:schoopedia_app/Theme/theme.dart';

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
        child: SvgPicture.asset(
          icon ??"assets/images/arrow-left.svg",
          color: iconColor ?? ThemeClass.blackColor,
          height: height ?? 24.h,
          width: width ?? 24.h,
        ),
      ),
    );
  }
}
