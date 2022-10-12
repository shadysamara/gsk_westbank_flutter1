import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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
                  fit: BoxFit.cover, image: AssetImage('images/image1.jpg'))),
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
    );
  }
}
