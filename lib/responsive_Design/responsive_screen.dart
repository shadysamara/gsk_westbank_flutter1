import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Responsive Design')),
      body: Container(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 2,
        color: MediaQuery.of(context).orientation == Orientation.landscape
            ? Colors.red
            : Colors.yellow,
      ),
    );
  }
}
