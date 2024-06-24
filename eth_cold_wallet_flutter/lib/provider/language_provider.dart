import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../main.dart';
import '../utils/ab_shared_preferences.dart';

S AB_getS(BuildContext context) {
  return Provider.of<LanguageProvider>(context, listen: true).getS(context);
}

class LanguageProvider extends ChangeNotifier {
  Locale _locale = Localizations.localeOf(MyApp.context);
  Locale get locale => _locale;

  S getS(BuildContext context) {
    return S.of(context);
  }

  static void changeLanguage(Locale newLocale) {
    // 存储语言设置
    saveLanguage(newLocale.languageCode);
    // 设置语言环境
    LanguageProvider provider = Provider.of<LanguageProvider>(
        MyApp.context,
        listen: false);
    provider._locale = newLocale;
    S.load(newLocale);
    provider.notifyListeners();
  }

  // 存储语言设置
  static void saveLanguage(String language) async {
    await ABSharedPreferences.setLanguageCode(language);
    final languageCode = await ABSharedPreferences.getLanguageCode();
    print("获取的语言环境 - ${languageCode}");
  }

}