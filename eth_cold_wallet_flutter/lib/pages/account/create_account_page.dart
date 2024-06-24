import 'package:eth_cold_wallet_flutter/provider/language_provider.dart';
import 'package:eth_cold_wallet_flutter/provider/theme_provider.dart';
import 'package:eth_cold_wallet_flutter/utils/ab_screen.dart';
import 'package:flutter/material.dart';

import '../../widget/ab_app_bar.dart';
import '../../widget/ab_text.dart';
import '../../widget/ab_text_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> with WidgetsBindingObserver {

  String _name = "";
  String _password = "";
  /// 底部高度(用于控制“创建按钮”到底部的距离，避免键盘弹出时，底部按钮距离键盘太远)
  double _bottomHeight = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bottomHeight = ABScreen.bottomHeight + 10.px;
    // 注册键盘状态监听器
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // 移除键盘状态监听器
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ABTheme theme = AB_theme(context).theme;
    return Scaffold(
      appBar: ABAppBar(
        title: AB_getS(context).createAccount,
      ),
      body: Container(
        color: theme.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTextField(AB_getS(context).name, "", AB_getS(context).inputName,
                        onChanged: (text) {
                      _name = text;
                    }),
                    _buildTextField(
                        AB_getS(context).password, "", AB_getS(context).inputPassword,
                        isPassword: true,
                        tipText: AB_getS(context).passwordTip,
                        keyboardType: TextInputType.visiblePassword, onChanged: (text) {
                      _password = text;
                    }),
                  ],
                ),
              ),
            ),
            // 创建账号按钮
            ElevatedButton(
              onPressed: () {
                if (_name.isEmpty) {
                  print("名称为空");
                  return;
                }
                if (_password.isEmpty) {
                  print("密码为空");
                  return;
                }
                // 收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                print("create account");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                // 设置按钮的背景颜色
                minimumSize: Size(ABScreen.width - 32.px, 46.px),
                // 设置按钮的最小尺寸
                padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 16.px),
                // 设置内边距
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // 设置圆角
                ),
              ),
              child: ABText(
                AB_getS(context).createAccount,
                fontSize: 14.px,
                textColor: theme.white,
              ),
            ),
            SizedBox(height: ABScreen.bottomHeight + 10.px,),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardOpen) {
      setState(() {
        _bottomHeight = 10.px;
      });
    } else {
      setState(() {
        _bottomHeight = ABScreen.bottomHeight + 10.px;
      });
    }
  }

  Widget _buildTextField(String title, String text, String hintText,
      {bool isPassword = false,
      TextInputType keyboardType = TextInputType.text,
        String? tipText,
      Function(String)? onChanged}) {
    final theme = AB_theme(context).theme;
    final controller = TextEditingController();
    controller.text = text;
    return Container(
      color: theme.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: 16.px, right: 16.px, top: 10.px, bottom: 6.px),
              child: ABText(
                title,
                textColor: theme.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              )),
          Container(
            padding: EdgeInsets.only(left: 16.px, right: 16.px),
            child: ABTextField(
              text: text,
              textColor: theme.textColor,
              hintText: hintText,
              hintColor: theme.textgrey,
              textSize: 14.px,
              isPassword: isPassword,
              keyboardType: keyboardType,
              onChanged: (text) => onChanged?.call(text),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.px, right: 16.px),
            child: Divider(color: theme.backgroundColor,),
          ),
          (tipText != null && tipText.isNotEmpty) ? Padding(
            padding: EdgeInsets.only(left: 16.px, right: 16.px, top: 0, bottom: 10.px),
            child: ABText(
              "* $tipText",
              textColor: Colors.red,
              fontSize: 12.px,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.clip,
              softWrap: true,
            ),
          ) : Container(),
        ],
      ),
    );
  }

}
