import 'package:flutter/material.dart';

import 'package:flutter_application_1/navigation/page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('screen3',
                  arguments: {"name": "shady", "city": "gaza"});
            },
            child: Text('Go to page 2')),
      ),
    );
  }
}

class Page2Arguments {
  String name;
  String message;
  Page2Arguments({
    required this.name,
    required this.message,
  });
}
