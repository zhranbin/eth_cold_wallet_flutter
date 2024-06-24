import 'package:eth_cold_wallet_flutter/pages/account/import_account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/language_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/ab_route.dart';
import '../../utils/ab_screen.dart';
import '../../widget/ab_text.dart';
import 'create_account_page.dart';

class NoAccountPage extends StatefulWidget {
  const NoAccountPage({super.key});

  @override
  State<NoAccountPage> createState() => _NoAccountPageState();
}

class _NoAccountPageState extends State<NoAccountPage>
    {
  ABTheme _currentTheme = ABTheme();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _currentTheme = Provider.of<ThemeProvider>(context, listen: true).theme;
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
                  ABRoute.push(ImportAccountPage());
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
}
