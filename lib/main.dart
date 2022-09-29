import 'package:flutter/material.dart';
import 'package:flutter_application_1/student.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: MyFirstUi(),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  color: Colors.blue,
                  child: Image.asset(
                    'images/image1.jpg',
                    fit: BoxFit.cover,
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  color: Colors.indigo,
                  child: Image.asset(
                    'images/image2.jpg',
                    fit: BoxFit.cover,
                  )),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  color: Colors.green,
                  child: Image.asset(
                    'images/image3.jpg',
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ));
  }
}
// vs code plugin to display images in compile time
// image_preview
