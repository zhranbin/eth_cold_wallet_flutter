import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ABText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;

  /// 文字超出显示方式
  final TextOverflow? overflow;

  /// 是否换行
  final bool? softWrap;
  final TextAlign? textAlign;

  const ABText(
    this.text, {
    super.key,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight,
    this.backgroundColor,
    this.overflow = TextOverflow.ellipsis,
    this.softWrap = true,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        backgroundColor: backgroundColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
