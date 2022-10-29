import 'package:flutter/material.dart';

class DisplayContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: Text('return value to previous page'),
        onPressed: () {
          Navigator.of(context).pop('this is a message from pop operation');
        },
      ),
    );
  }
}
