import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/router/app_router.dart';

import 'package:flutter_application_1/task_managment/data/dymmy_data.dart';
import 'package:flutter_application_1/task_managment/models/task_model.dart';
import 'package:flutter_application_1/task_managment/views/screens/all_tasks_screen.dart';
import 'package:flutter_application_1/task_managment/views/screens/complete_tasks_screen.dart';
import 'package:flutter_application_1/task_managment/views/screens/inComplete_Tasks.dart';
import 'package:flutter_application_1/task_managment/views/screens/new_task_screen.dart';

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

  addNewTask(TaskModel task) {
    tasks.add(task);
    setState(() {});
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
    log('main scren has been rebuilt');
    // TODO: implement build
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  AppRouter.goToWidget(NewTaskScreen(addNewTask));
                  AppRouter.goToScreen('routeName');
                }),
            drawer: Drawer(
              child: DrawerColumn(tabController: tabController),
            ),
            appBar: AppBar(
              title: Text('Task Management'),
              bottom: CustomTabBar(tabController: tabController),
            ),
            body: ScaffoldBody(
              checkTask: checkTask,
              tabController: tabController,
            ),
          )
        : Scaffold(
            appBar: CustomTabBar(tabController: tabController),
            body: Row(children: [
              Expanded(
                flex: 1,
                child: DrawerColumn(tabController: tabController),
              ),
              Expanded(
                  flex: 2,
                  child: ScaffoldBody(
                    checkTask: checkTask,
                    tabController: tabController,
                  ))
            ]),
          );
  }
}

class ScaffoldBody extends StatelessWidget {
  final TabController tabController;
  final Function checkTask;
  const ScaffoldBody({
    Key? key,
    required this.tabController,
    required this.checkTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBarView(controller: tabController, children: [
      AllTasksScreen(checkTask),
      CompleteTasksScreen(checkTask),
      InCompleteTasksScreen(checkTask)
    ]);
  }
}

class DrawerColumn extends StatelessWidget {
  final TabController tabController;
  const DrawerColumn({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
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
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('COMPLETE TASKS'),
          subtitle: Text('go to complete tasks page'),
          leading: Icon(Icons.done),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            tabController.animateTo(1);
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('INCOMPLETE TASKS'),
          subtitle: Text('go to incomplete tasks page'),
          leading: Icon(Icons.cancel),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            tabController.animateTo(2);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  const CustomTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TabBar(controller: tabController, tabs: [
      Tab(
        text: 'All Tasks',
      ),
      Tab(
        text: 'Complete Tasks',
      ),
      Tab(
        text: 'Incomplete Tasks',
      ),
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => TabBar(tabs: []).preferredSize;
}
