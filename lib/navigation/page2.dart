import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/page1.dart';

class Page2 extends StatelessWidget {
  String param;
  Page2(this.param);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(param),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Go back to page 1')),
          ],
        ),
      ),
    );
  }
}
