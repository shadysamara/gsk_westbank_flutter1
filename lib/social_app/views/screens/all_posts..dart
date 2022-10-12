import 'package:flutter/material.dart';
import 'package:flutter_application_1/social_app/repositories/dummy_data.dart';
import 'package:flutter_application_1/social_app/views/widgets/post_widget.dart';

class AllPostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostWidget(posts[index]);
        });
  }
}
