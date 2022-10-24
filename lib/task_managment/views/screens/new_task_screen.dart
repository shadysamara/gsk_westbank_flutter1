import 'package:flutter/material.dart';
import 'package:flutter_application_1/task_managment/data/dymmy_data.dart';
import 'package:flutter_application_1/task_managment/models/task_model.dart';

class NewTaskScreen extends StatefulWidget {
  Function function;
  NewTaskScreen(this.function);
  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TextEditingController controller = TextEditingController();
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task Screen'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                labelText: 'Task title',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
          CheckboxListTile(
              title: Text('task is complete'),
              value: isComplete,
              onChanged: (v) {
                isComplete = !isComplete;
                setState(() {});
              }),
          ElevatedButton(
              onPressed: () {
                TaskModel taskModel = TaskModel(controller.text, isComplete);
                tasks.add(taskModel);
                Navigator.of(context).pop();
              },
              child: Text('Add New Task'))
        ],
      ),
    );
  }
}
