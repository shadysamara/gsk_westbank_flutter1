import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_managment/data/dymmy_data.dart';
import 'package:flutter_application_1/task_managment/models/task_model.dart';
import 'package:flutter_application_1/task_managment/views/screens/all_tasks_screen.dart';
import 'package:flutter_application_1/task_managment/views/screens/complete_tasks_screen.dart';
import 'package:flutter_application_1/task_managment/views/screens/inComplete_Tasks.dart';

class MainTaskScreen extends StatefulWidget {
  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen> {
  checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Task Management'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Complete Tasks',
            ),
            Tab(
              text: 'Incomplete Tasks',
            ),
          ]),
        ),
        body: TabBarView(children: [
          AllTasksScreen(checkTask),
          CompleteTasksScreen(checkTask),
          InCompleteTasksScreen(checkTask)
        ]),
      ),
    );
  }
}
