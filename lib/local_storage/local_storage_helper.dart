import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static late SharedPreferences sharedPreferences;
  static initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveDataInSp(String data) {
    sharedPreferences.setString("content", data);
  }

  static String? getDataFromSp() {
    String? content = sharedPreferences.getString("content");
    return content;
  }

  static setFirstTime() {
    sharedPreferences.setBool('isFirst', false);
  }

  static bool getFirstTime() {
    return sharedPreferences.getBool('isFirst') ?? true;
  }
}
