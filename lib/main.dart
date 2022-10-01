import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/student.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: NewsApp(),
  ));
}

class MyFirstUi extends StatelessWidget {
  String imageUrl =
      'https://images.unsplash.com/photo-1663930981910-7a4c077feb85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1828&q=80';
  String imageUrl2 = "https://unsplash.com/photos/ea1E5cxVjgg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('GSK west bank'),
        ),
        /*
        to add images from assets to your UI
        1- create new folder in your main project path
        2- put the images in the created folder
        3- add your folder path to asset in pubspec.yaml
        4- use image.asset to display the image
        */
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/image1.jpg'),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Ahmed Hassan'), Text('Since 23 minuites')],
                  )
                ],
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/image1.jpg'))),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.share,
                    size: 30,
                  )
                ],
              ),
            ),
            Text('Hello this is my first post')
          ],
        ));
  }
}
// vs code plugin to display images in compile time
// image_preview

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: news.map((e) {
          return Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  e['urlToImage'] ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (x, y, z) {
                    return Image.asset(
                      'images/image1.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e['title'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(e['description']),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
