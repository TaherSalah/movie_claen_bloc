import 'package:shared_preferences/shared_preferences.dart';
import 'shared_obj.dart';

class SharedPref {
  static const String _userObj = "userObj";
  static const String _language = "language_code";
  static const String _deviceId = "device_id";
  static const String _intro = "intro";
  static const String _Login = "access_token";




  static Future<void> setLogIn({ String? token}) async {
    await SharedObj().prefs?.setString(_Login, token??'');

  }
  static String? getLogIn() {
    return SharedObj().prefs?.getString(_Login);
  }
  static bool isUserLogIn() {
    return SharedObj().prefs?.getString(_userObj) != null;
  }

  static Future<void> logOut() async {
    await SharedObj().prefs?.remove(_userObj);
  }

  static String? getCurrentLang() {
    return SharedObj().prefs?.getString(_language);
  }

  static Future<void> setCurrentLang({required String lang}) async {
    await SharedObj().prefs?.setString(_language, lang);
  }

  Future<String> getValueFromSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      return prefs.getString(key) ?? '';
    } else {
      return '';
    }
  }
  // saving Device Id
  static Future<void> setDeviceID({required String deviceID}) async {
    await SharedObj().prefs?.setString(_deviceId, deviceID);
  }

  // getting Device Id
  static String? getDeviceID() {
    return SharedObj().prefs?.getString(_deviceId);
  }

  static Future<void> saveWatchIntro() async {
    await SharedObj().prefs?.setBool(_intro, true);
  }

  static bool isWatchIntro() {
    return SharedObj().prefs?.getBool(_intro) ?? false;
  }
}
