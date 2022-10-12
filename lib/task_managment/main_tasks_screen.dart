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

class _MainTaskScreenState extends State<MainTaskScreen>
    with SingleTickerProviderStateMixin {
  checkTask(TaskModel taskModel) {
    int index = tasks.indexOf(taskModel);
    tasks[index].isComplete = !tasks[index].isComplete;
    setState(() {});
  }

  late TabController tabController;
  initalizeTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initalizeTabController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text('S'),
              ),
              accountName: Text('Shady'),
              accountEmail: Text('shady@gmail.com'),
            ),
            ListTile(
              title: Text('ALL TASKS'),
              subtitle: Text('go to all tasks page'),
              leading: Icon(Icons.list),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(0);
              },
            ),
            ListTile(
              title: Text('COMPLETE TASKS'),
              subtitle: Text('go to complete tasks page'),
              leading: Icon(Icons.done),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(1);
              },
            ),
            ListTile(
              title: Text('INCOMPLETE TASKS'),
              subtitle: Text('go to incomplete tasks page'),
              leading: Icon(Icons.cancel),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                tabController.animateTo(2);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Task Management'),
        bottom: TabBar(controller: tabController, tabs: [
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
      body: TabBarView(controller: tabController, children: [
        AllTasksScreen(checkTask),
        CompleteTasksScreen(checkTask),
        InCompleteTasksScreen(checkTask)
      ]),
    );
  }
}
