import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileHelper {
  static writeOnFile(String data) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path;
      File file = File('$path/gsk.txt');
      file.writeAsString(data);
    } on Exception catch (e) {
      // TODO
    }
  }

  static Future<String> readFromFile() async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      String path = directory.path;
      File file = File('$path/gsk.txt');
      String fileContent = await file.readAsString();
      return fileContent;
    } catch (e) {
      return 'exception occured';
    }
  }
}
