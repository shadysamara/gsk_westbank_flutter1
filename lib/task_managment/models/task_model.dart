import 'package:flutter_application_1/task_managment/data/todo_db_helper.dart';

class TaskModel {
  late String name;
  late bool isComplete;
  TaskModel(this.name, this.isComplete);
  TaskModel.fromMap(Map map) {
    name = map[TodoDbHelper.todoDbHelper.taskNameColumnName];
    isComplete = map[TodoDbHelper.todoDbHelper.taskisCompleteColumnName] == 1
        ? true
        : false;
  }
  toMap() {
    return {
      TodoDbHelper.todoDbHelper.taskNameColumnName: name,
      TodoDbHelper.todoDbHelper.taskisCompleteColumnName: isComplete
    };
  }
}
