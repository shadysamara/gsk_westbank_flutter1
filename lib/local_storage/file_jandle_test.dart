import 'package:flutter/material.dart';
import 'package:flutter_application_1/local_storage/display_all_file_content.dart';
import 'package:flutter_application_1/local_storage/file_helper.dart';

class FileHandleTest extends StatefulWidget {
  @override
  State<FileHandleTest> createState() => _FileHandleTestState();
}

class _FileHandleTestState extends State<FileHandleTest> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              dynamic x = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return DisplayContentScreen();
              }));
              print(x);
            },
            child: Text('go to display screen'),
          ),
          ElevatedButton(
            onPressed: () {
              FileHelper.writeOnFile('hello from gaza');
            },
            child: Text('Write on file'),
          ),
          ElevatedButton(
            onPressed: () async {
              String content = await FileHelper.readFromFile();
              this.content = content;
              setState(() {});
            },
            child: Text('Read from file'),
          ),
          Text(content)
        ],
      ),
    );
  }
}
