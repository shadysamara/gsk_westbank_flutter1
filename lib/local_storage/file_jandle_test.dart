import 'package:flutter/material.dart';
import 'package:flutter_application_1/local_storage/display_all_file_content.dart';
import 'package:flutter_application_1/local_storage/local_storage_helper.dart';

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
              FileHelper.saveDataInSp(
                  'this is my first words in shared prefences');
            },
            child: Text('Write on sp'),
          ),
          ElevatedButton(
            onPressed: () {
              String? content = FileHelper.getDataFromSp();
              this.content = content ?? 'no value found';
              setState(() {});
            },
            child: Text('Read from sp'),
          ),
          Text(content)
        ],
      ),
    );
  }
}
