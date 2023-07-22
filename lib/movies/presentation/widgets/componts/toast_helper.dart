


import 'package:movie_db_bloc/core/exports/exports_files.dart';

class ToastHelper {
  static Future showError(
      {required String message, Color? backgroundColor}) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor ?? Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.sp,
    );
  }

  static Future showSuccess(
      {required String message, Color? backgroundColor}) async {
    await Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: backgroundColor ?? Colors.green,
        textColor: Colors.white,
        fontSize: 16.sp);
  }
}
