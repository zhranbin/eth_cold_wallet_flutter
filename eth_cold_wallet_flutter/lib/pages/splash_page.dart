import 'package:eth_cold_wallet_flutter/utils/ab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';
import '../provider/theme_provider.dart';
import '../utils/ab_route.dart';
import '../utils/ab_shared_preferences.dart';
import '../utils/account/account_manager.dart';
import '../widget/ab_text.dart';
import 'account/create_account_page.dart';
import 'account/no_account_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAPP();
    _checkData();
  }

  @override
  Widget build(BuildContext context) {
    ABTheme _currentTheme = Provider.of<ThemeProvider>(context, listen: true).theme;
    return Scaffold(
      body: Container(
        color: _currentTheme.backgroundColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: ABScreen.navigationBarHeight +
                    ABScreen.statusHeight +
                    80.px,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.px),
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 100.px,
                    height: 100.px,
                  ),
                ),
              ),
              SizedBox(
                height: 40.px,
              ),
              ABText(
                AB_getS(context).noAccount,
                fontSize: 16.px,
                textColor: _currentTheme.textColor,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(child: Container()),
              // 创建账号
              ElevatedButton(
                onPressed: () {
                  print("创建账号");
                  // AccountManager.createAccount("name", "123456");
                  ABRoute.push(const CreateAccountPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentTheme.primaryColor,
                  // 设置按钮的背景颜色
                  minimumSize: Size(ABScreen.width - 32.px, 46.px),
                  // 设置按钮的最小尺寸
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  // 设置内边距
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 设置圆角
                  ),
                ),
                child: ABText(
                  AB_getS(context).createAccount,
                  fontSize: 14.px,
                  textColor: _currentTheme.white,
                ),
              ),
              SizedBox(height: 20.px,),
              // 导入账号
              ElevatedButton(
                onPressed: () {
                  print("导入账号");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _currentTheme.primaryColor,
                  // 设置按钮的背景颜色
                  minimumSize: Size(ABScreen.width - 32.px, 46.px),
                  // 设置按钮的最小尺寸
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  // 设置内边距
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 设置圆角
                  ),
                ),
                child: ABText(
                  AB_getS(context).importAccount,
                  fontSize: 14.px,
                  textColor: _currentTheme.white,
                ),
              ),
              SizedBox(height: ABScreen.bottomHeight + 10.px,)
            ],
          ),
        ),
      ),
    );
  }

  /// 初始化app相关的东西
  Future<void> initAPP() async {
    // 获取存储的语言
    String languageCode = await ABSharedPreferences.getLanguageCode() ?? "zh";
    print("获取的语言环境 - ${languageCode}");
    // 设置语言
    LanguageProvider.changeLanguage(Locale.fromSubtags(languageCode: languageCode));
  }

  void _checkData() async {
    final accounts = await AccountManager.getAccounts();
    print("数据库账号列表 - ${accounts}");
    if (accounts.isEmpty) {
      _gotoNoAccount();
    } else {
      _gotoHome();
    }

  }

  void _gotoNoAccount() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return const NoAccountPage();
    }));
  }

  void _gotoHome() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    //   return const MainPage();
    // }));
  }


}
