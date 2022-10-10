import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPostScreen extends StatefulWidget {
  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  bool isDark = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    log('initState method');
    isDark = true;
  }

  String content = '';
  List<String> comments = [];
  @override
  Widget build(BuildContext context) {
    log('build method');
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('GSK west bank'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/image1.jpg'),
                        radius: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Ahmed Hassan'),
                            Text('Since 23 minuites')
                          ],
                        ),
                      ),
                      CupertinoSwitch(
                        value: isDark,
                        onChanged: (d) {
                          isDark = d;
                          setState(() {});
                        },
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
                    margin: const EdgeInsets.all(10), child: IsLikedButton()),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hello this is my first post'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Add Comment'),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (v) {
                                content = v;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              comments.add(content);
                              setState(() {});
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(15),
                                child: Icon(Icons.send)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      ...comments.map((e) {
                        return Text(e);
                      }).toList()
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class AcceptConditions extends StatefulWidget {
  @override
  State<AcceptConditions> createState() => _AcceptConditionsState();
}

class _AcceptConditionsState extends State<AcceptConditions> {
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
              value: isAccepted,
              onChanged: (value) {
                isAccepted = value!;
                setState(() {});
              }),
          SizedBox(
            width: 10,
          ),
          Text('Accept Conditions')
        ],
      ),
    );
  }
}

class IsLikedButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IsLikedButtonState();
  }
}

class IsLikedButtonState extends State<IsLikedButton> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        isLiked = !isLiked;

        setState(() {});
      },
      child: Icon(
        Icons.favorite,
        size: 80,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
