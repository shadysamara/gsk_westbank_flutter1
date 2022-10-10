import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_managment/data/dymmy_data.dart';
import 'package:flutter_application_1/task_managment/models/task_model.dart';
import 'package:flutter_application_1/task_managment/views/widgets/task_widget.dart';

class AllTasksScreen extends StatelessWidget {
  Function function;
  AllTasksScreen(this.function);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(tasks[index], function);
        });
  }
}
