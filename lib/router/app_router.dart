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

  static goToScreenAndReplacenAmed(String routeName) {
    navigationKey.currentState!.pushReplacementNamed(routeName);
  }

  static goToScreenAndReplace(Widget screen) {
    navigationKey.currentState!.pushReplacement(MaterialPageRoute(builder: (x) {
      return screen;
    }));
  }

  static showCustomDialoug(String message, String title) {
    showDialog(
        context: navigationKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
          );
        });
  }
}
