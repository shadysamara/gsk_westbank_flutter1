import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_app/views/screens/all_posts..dart';
import 'package:flutter_application_1/social_app/views/screens/favourite_screen.dart';

class MainSocialAppScreen extends StatefulWidget {
  @override
  State<MainSocialAppScreen> createState() => _MainSocialAppScreenState();
}

class _MainSocialAppScreenState extends State<MainSocialAppScreen> {
  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Social Media App')),
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
