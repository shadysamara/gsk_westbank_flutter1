import 'dart:developer';
import 'dart:io';

import 'package:flutter_application_1/data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqlHelper {
  SqlHelper._();
  static SqlHelper sqlHelper = SqlHelper._();
  // CRUD => CREATE READ UPDATE DELETE
  late Database database;
  connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/tasks.db';
    database = await openDatabase(path, version: 3, onCreate: (db, v) {
      log('the database is created');
      db.execute('''
  CREATE TABLE tasks(
  id INTEGER primary key autoincrement,
  taskName varchar(50),
  isComplete INTEGER
)
''');
    }, onOpen: (db) {
      log('the database is connected');
    }, onUpgrade: (db, oldVersion, newVersion) {
      db.execute('''
  CREATE TABLE tasks(
  id INTEGER primary key autoincrement,
  taskName varchar(50),
  isComplete INTEGER
)
''');
    });
  }

  insertNewTask() {
    database
        .insert('tasks', {'taskName': "flutter profgramming", "isComplete": 1});
  }

  getAllTasks() async {
    List<Map<String, Object?>> results = await database.query('tasks');
    log(results.length.toString());
  }

  getOneTask() {}
  deleteTask() {}
  updateTask() {}
  getAllTables() async {
    List<Map<String, Object?>> tables = await database.query('sqlite_master');
    tables.forEach((element) {
      log(element['name'].toString());
    });
  }
}
