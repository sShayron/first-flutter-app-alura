import 'package:flutter_webapi_first_course/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout() {
  SharedPreferences.getInstance().then((prefs) {
    prefs.remove("accessToken");
    prefs.remove("id");
    prefs.remove("email");
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      'login',
      (route) => false,
    );
  });
}
