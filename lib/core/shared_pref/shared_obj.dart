


import '../exports/exports_files.dart';

class SharedObj {
  // singleton
  factory SharedObj() {
    _this ??= SharedObj._();
    return _this!;
  }
  static SharedObj? _this;
  SharedObj._();

  SharedPreferences? prefs;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  //FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  init() async {
    prefs = await SharedPreferences.getInstance();
    navigatorKey = GlobalKey<NavigatorState>();
  }
}
