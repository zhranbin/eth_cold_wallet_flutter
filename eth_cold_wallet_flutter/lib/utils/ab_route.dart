import 'package:flutter/material.dart';

import '../main.dart';

class ABRoute {

  /// 跳转到指定界面
  /// page: 跳转的页面
  /// context: 是用于执行导航的BuildContext。如果未提供，则使用MyApp的上下文。
  /// argument: 传递的参数
  /// tag: 跳转的页面的tag
  /// maintainState: 默认true
  /// fullscreenDialog: 默认false，类似iOS中的模态视图
  /// allowSnapshotting: 默认true
  /// barrierDismissible: 默认false
  static push(
    Widget page, {
        BuildContext? context,
    Object? argument,
    String? tag,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
  }) {
    RouteSettings settings;
    if (tag != null) {
      settings =
          RouteSettings(name: "${page.routerName()}#$tag", arguments: argument);
    } else {
      settings = RouteSettings(name: page.routerName(), arguments: argument);
    }
    Navigator.push(
      context ?? MyApp.context,
      MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
          barrierDismissible: barrierDismissible),
    );
  }

  /// 使用指定的页面替换当前页面，并导航到新页面。
  static pushReplacement(
    Widget page, {
    BuildContext? context,
    Object? argument,
    String? tag,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
    bool barrierDismissible = false,
  }) {
    RouteSettings settings;
    if (tag != null) {
      settings =
          RouteSettings(name: "${page.routerName()}#$tag", arguments: argument);
    } else {
      settings = RouteSettings(name: page.routerName(), arguments: argument);
    }
    Navigator.pushReplacement(
      context ?? MyApp.context,
      MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
          barrierDismissible: barrierDismissible),
    );
  }

  /// 跳转到指定页面
  /// routeName: 跳转的页面的routeName
  static pushNamed(
    String routeName, {
    BuildContext? context,
    Object? argument,
  }) {
    Navigator.pushNamed(
      context ?? MyApp.context,
      routeName,
      arguments: argument,
    );
  }

  /// 返回上一个页面
  static pop({BuildContext? context}) {
    Navigator.pop(context ?? MyApp.context);
  }

  /// 返回到根页面
  static popToRoot({BuildContext? context}) {
    Navigator.popUntil(context ?? MyApp.context, (route){
      return route.isFirst;
    });
  }

  /// 返回到指定页面
  static popUntil(BuildContext? context, bool Function(Route<dynamic>) predicate) {
    Navigator.popUntil(context ?? MyApp.context, predicate);
  }

  /// 返回到指定页面(routeName)
  static popToRouteName(String routeName, {BuildContext? context}) {
    Navigator.popUntil(context ?? MyApp.context, (route) {
      return route.settings.routerName() == routeName;
    });
  }

  /// 返回到指定页面(tag)
  static popToTag({required String tag, BuildContext? context}) {
    Navigator.popUntil(context ?? MyApp.context, (route) {
      return route.settings.tag() == tag;
    });
  }

  /// 返回到指定页面(routeName)和(tag)
  static popToRouteNameWithTag(String routeName, String tag, {BuildContext? context}) {
    Navigator.popUntil(context ?? MyApp.context, (route) {
      return route.settings.routerName() == routeName && route.settings.tag() == tag;
    });
  }
}

extension ABWidget on Widget {
  String routerName() {
    return (this).toString();
  }
}

extension ABRouteSettings on RouteSettings {
  String routerName() {
    return name?.split("#").first ?? "";
  }

  String tag() {
    final data = name?.split("#") ?? [];
    if (data.length > 1) {
      return data[1];
    }
    return "";
  }
}
