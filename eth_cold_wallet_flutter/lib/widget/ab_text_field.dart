import 'package:flutter/material.dart';

class ABTextField extends StatefulWidget {
  final String text;
  final Color? textColor;
  final String? hintText;
  final Color? hintColor;
  final double? textSize;
  final bool isPassword;
  final TextInputType? keyboardType;

  /// 显示隐藏密码按钮的大小
  final double obscureBtnSize;

  /// 显示隐藏密码按钮Icon的大小
  final double obscureIconSize;
  final Function(String)? onChanged;

  const ABTextField(
      {super.key,
      this.text = '',
      this.textColor,
      this.hintText = '',
      this.hintColor,
      this.textSize,
      this.isPassword = false,
      this.keyboardType,
      this.onChanged,
      this.obscureBtnSize = 40,
      this.obscureIconSize = 20});

  @override
  State<ABTextField> createState() => _ABTextFieldState();
}

class _ABTextFieldState extends State<ABTextField> {
  bool _obscureText = true;
  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isDarkMode = brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          child: TextField(
            obscureText: _obscureText,
            controller: controller,
            onChanged: (text) {
              widget.onChanged?.call(text);
            },
            enabled: true,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              hintStyle: TextStyle(fontSize: 14, color: widget.hintColor ?? (isDarkMode ? Colors.grey : Colors.grey)),
              labelStyle: TextStyle(fontSize: 14, color: widget.hintColor ?? (isDarkMode ? Colors.grey : Colors.grey)),
            ),
            style: TextStyle(
              fontSize: widget.textSize,
              color: widget.textColor ?? (isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        ),
        !widget.isPassword
            ? Container()
            : SizedBox(
                width: widget.obscureBtnSize,
                height: widget.obscureBtnSize,
                child: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: _obscureText ? (widget.textColor ?? (isDarkMode ? Colors.white : Colors.black)) : widget.hintColor ?? Colors.grey,
                    size: widget.obscureIconSize,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
      ],
    );
  }
}
