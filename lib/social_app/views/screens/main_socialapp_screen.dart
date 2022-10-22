import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_app/views/screens/all_posts..dart';
import 'package:flutter_application_1/social_app/views/screens/favourite_screen.dart';
import 'package:flutter_application_1/social_app/views/widgets/custom_appbar.dart';

class MainSocialAppScreen extends StatefulWidget {
  @override
  State<MainSocialAppScreen> createState() => _MainSocialAppScreenState();
}

class _MainSocialAppScreenState extends State<MainSocialAppScreen> {
  PageController pageController = PageController();

  int currentIndex = 0;
  String title = 'github lecture';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: customAppbar(),
      body: PageView(
          controller: pageController,
          children: [AllPostsScreen(), LikedPostsScreen()]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
            pageController.animateToPage(index,
                duration: Duration(microseconds: 100), curve: Curves.linear);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
          ]),
    );
  }
}
