
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/theme_provider.dart';

class ABSharedPreferences {
  // 语言环境
  static const String languageCodeKey = 'language_code';

  static Future<String?> getLanguageCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(languageCodeKey);
  }

  static Future<bool> setLanguageCode(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(languageCodeKey, languageCode);
  }

  // 主题
  static const String themeKey = 'theme_key';

  static Future<ABThemeType> getThemeType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (prefs.getString(themeKey)) {
      case 'light':
        return ABThemeType.light;
      case 'dark':
        return ABThemeType.dark;
      default:
        return ABThemeType.system;
    }
  }

  static Future<bool> setThemeType(ABThemeType theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (theme) {
      case ABThemeType.light:
        return prefs.setString(themeKey, 'light');
      case ABThemeType.dark:
        return prefs.setString(themeKey, 'dark');
      default:
        return prefs.setString(themeKey, 'system');
    }
  }


}