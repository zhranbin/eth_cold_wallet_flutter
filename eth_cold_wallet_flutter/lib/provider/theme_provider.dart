import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

ThemeProvider AB_theme(BuildContext context) {
  return Provider.of<ThemeProvider>(context, listen: true);
}

class ThemeProvider extends ChangeNotifier {
  final ABTheme _lightTheme = const ABTheme(id: "light");
  final ABTheme _darkTheme = const ABTheme(
    id: "dark",
    primaryColor: Color(0xFF3FB1FF),
    secondaryColor: Color(0xFF147AFF),
    backgroundColor: Color(0xFF101010),
    textColor: Colors.white,
    white: Colors.black,
    black: Colors.white,
    textgrey: Color(0xFF808080),
    appbarBgColor: Color(0xFF0a0a0a),
    appbarTextColor: Colors.white,
  );
  ABThemeType _type = ABThemeType.system;

  ABTheme get theme => _getTheme();
  ABThemeType get type => _type;

  String _themeId = "light";
  String get themeId => _themeId;

  void changeTheme(ABThemeType type) {
    _type = type;
    switch (type) {
      case ABThemeType.light:
        _themeId = "light";
        break;
      case ABThemeType.dark:
        _themeId = "dark";
        break;
      default:
        final brightness = MediaQuery.platformBrightnessOf(MyApp.context);
        bool isDarkMode = brightness == Brightness.dark;
        _themeId = isDarkMode ? "dark" : "light";
        break;
    }
    notifyListeners();
  }

  ABTheme getTheme(BuildContext context) {
    switch (_type) {
      case ABThemeType.light:
        return _lightTheme;
      case ABThemeType.dark:
        return _darkTheme;
      default:
        final brightness = MediaQuery.platformBrightnessOf(context);
        bool isDarkMode = brightness == Brightness.dark;
        return isDarkMode ? _darkTheme : _lightTheme;
    }
  }

  ABTheme _getTheme() {
    switch (_type) {
      case ABThemeType.light:
        return _lightTheme;
      case ABThemeType.dark:
        return _darkTheme;
      default:
        final brightness = MediaQuery.platformBrightnessOf(MyApp.context);
        bool isDarkMode = brightness == Brightness.dark;
        return isDarkMode ? _darkTheme : _lightTheme;
    }
  }

}

enum ABThemeType {
  light,
  dark,
  system
}



class ABTheme {
  const ABTheme({
    // id
    this.id = 'default',
    /// 应用主色
    this.primaryColor = const Color(0xFF3FB1FF),
    /// 应用次色
    this.secondaryColor = const Color(0xFF147AFF),
    /// 背景颜色
    this.backgroundColor = const Color(0xFFEFEFEF),
    /// 字色
    this.textColor = const Color(0xFF333333),
    this.white = Colors.white,
    this.black = Colors.black,
    /// 灰色文本
    this.textgrey = const Color(0xFFAEA4A3),
    /// Appbar 背景颜色
    this.appbarBgColor = const Color(0xFFF2F3F5),
    /// Appbar 文字颜色
    this.appbarTextColor = const Color(0xFF010000),
  });

  final String id;

  // 应用主色
  // Primary Color For The App
  final Color primaryColor;

  // 应用次色
  // Secondary Color For The App
  final Color secondaryColor;

  // 背景颜色
  final Color backgroundColor;

  // 字色
  // TextColor
  final Color textColor;

  // 白色
  // white
  final Color white;

  // 黑色
  // black
  final Color black;

  // 灰色文本
  // grey text color
  final Color textgrey;

  /// Appbar 背景颜色
  final Color appbarBgColor;

  /// Appbar 文字颜色
  final Color appbarTextColor;

}