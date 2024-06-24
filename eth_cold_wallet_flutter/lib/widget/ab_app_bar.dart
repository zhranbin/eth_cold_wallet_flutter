import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ABAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  const ABAppBar({
    super.key,
    this.backgroundColor,
    this.title = '',
    this.rightWidget,
  });

  final Color? backgroundColor;
  final String title;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    final bool isBack = ModalRoute.of(context)?.canPop ?? false;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double width = MediaQuery.of(context).size.width;
    final brightness = MediaQuery.platformBrightnessOf(context);
    bool isDarkMode = brightness == Brightness.dark;
    final Color bgColor =
        backgroundColor ?? (isDarkMode ? Colors.black : Colors.white);
    final Color titleColor = isDarkMode ? Colors.white : Colors.black;

    final Widget back = isBack
        ? Container(
          width: 44.0,
          height: 44.0,
          color: bgColor,
          child: IconButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();
                final isBack = await Navigator.maybePop(context);
                if (!isBack) {
                  await SystemNavigator.pop();
                }
              },
              tooltip: 'Back',
              padding:
                  const EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 5),
              icon: const Icon(CupertinoIcons.back),
            ),
        )
        : Container();

    return Container(
      height: statusBarHeight + 44.0,
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: statusBarHeight,
          ),
          Container(
            color: Colors.transparent,
            height: 44.0,
            width: width,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                    left: 0, top: 0, bottom: 0, width: 44.0, child: back),
                rightWidget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(44.0);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}
