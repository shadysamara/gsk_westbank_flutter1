import 'dart:developer';
import 'dart:io';

import 'package:flutter_application_1/router/app_router.dart';
import 'package:flutter_application_1/task_managment/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TodoDbHelper {
  TodoDbHelper._();
  static TodoDbHelper todoDbHelper = TodoDbHelper._();
  final String tableName = "tasks";
  final String taskIdColumnName = "id";
  final String taskNameColumnName = "taskName";
  final String taskisCompleteColumnName = "isComplete";
  late Database database;
  connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}/tasks.db';
    database = await openDatabase(path, version: 3, onCreate: (db, v) {
      log('the database is created');
      db.execute('''
  CREATE TABLE $tableName(
  $taskIdColumnName INTEGER primary key autoincrement,
  $taskNameColumnName varchar(50),
  $taskisCompleteColumnName INTEGER
)
''');
    }, onOpen: (db) {
      log('the database is connected');
    }, onUpgrade: (db, oldVersion, newVersion) {
      db.execute('''
  CREATE TABLE $tableName(
  $taskIdColumnName INTEGER primary key autoincrement,
  $taskNameColumnName varchar(50),
  $taskisCompleteColumnName INTEGER
)
''');
    });
  }

  insertNewTask(TaskModel taskModel) async {
    try {
      int i = await database.insert('tasks', taskModel.toMap());
      AppRouter.showCustomDialoug(
          'A new task has been added successfully', 'success add');
    } on Exception catch (e) {
      // TODO
    }
  }

  Future<List<TaskModel>> getAllTasks() async {
    List<Map<String, dynamic>> results = await database.query('tasks');
    return results.map((e) {
      return TaskModel.fromMap(e);
    }).toList();
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
