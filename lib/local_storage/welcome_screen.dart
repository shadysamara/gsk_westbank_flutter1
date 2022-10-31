import 'package:flutter/material.dart';
import 'package:flutter_application_1/local_storage/local_storage_helper.dart';
import 'package:flutter_application_1/router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen() {
    makeDelay();
  }
  navigateUser() {
    bool isFirstTime = FileHelper.getFirstTime();
    FileHelper.setFirstTime();
    if (isFirstTime) {
      AppRouter.goToScreenAndReplace(NewUSer());
    } else {
      AppRouter.goToScreenAndReplace(OldUSer());
    }
  }

  makeDelay() async {
    await Future.delayed(Duration(seconds: 3));
    navigateUser();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Welcome Page'),
      ),
    );
  }
}

class NewUSer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('New User'),
      ),
    );
  }
}

class OldUSer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('Old User'),
      ),
    );
  }
}
