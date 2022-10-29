import 'package:flutter/material.dart';

class AppRouter {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static goToWidget(Widget widget) {
    navigationKey.currentState!.push(MaterialPageRoute(builder: (x) {
      return widget;
    }));
  }

  static goToScreen(String routeName, [dynamic arguments]) {
    navigationKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static goToScreenAndReplace(String routeName) {
    navigationKey.currentState!.pushReplacementNamed(routeName);
  }
}
