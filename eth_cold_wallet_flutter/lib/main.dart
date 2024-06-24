import 'dart:async';
import 'package:eth_cold_wallet_flutter/pages/splash_page.dart';
import 'package:eth_cold_wallet_flutter/provider/language_provider.dart';
import 'package:eth_cold_wallet_flutter/provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      //可以多个provider进行分类处理
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ],
    child: MyApp(),
  ));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
class MyApp extends StatefulWidget {
  static MyApp? _singleton;

  MyApp({super.key}) {
    _singleton = this;
  }

  @override
  State<MyApp> createState() => _MyAppState();

  static BuildContext get context => navigatorKey.currentState!.context;
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    // 监听系统事件
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // 取消监听系统事件
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    // 亮度变化（主题模式发生改变也会）时的处理逻辑
    super.didChangePlatformBrightness();
    Future.delayed(const Duration(milliseconds: 200), () {
      final provider = Provider.of<ThemeProvider>(context, listen: false);
      if (provider.type == ABThemeType.system &&
          provider.theme.id != provider.themeId) {
        print("通知改变系统主题");
        provider.changeTheme(ABThemeType.system);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 点击空白处收起键盘
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashFactory: NoSplash.splashFactory, // 全局禁用波纹效果
        ),
        navigatorKey: navigatorKey,
        home: const SplashPage(),
      ),
    );
  }
}

