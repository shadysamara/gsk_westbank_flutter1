import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:flutter_application_1/ecommerce_app/views/ecommerce_main_screen.dart';
import 'package:flutter_application_1/local_storage/file_jandle_test.dart';
import 'package:flutter_application_1/local_storage/local_storage_helper.dart';
import 'package:flutter_application_1/local_storage/welcome_screen.dart';
import 'package:flutter_application_1/localization/localized_screen.dart';
import 'package:flutter_application_1/navigation/page1.dart';
import 'package:flutter_application_1/navigation/page2.dart';
import 'package:flutter_application_1/responsive_Design/responsive_screen.dart';
import 'package:flutter_application_1/router/app_router.dart';
import 'package:flutter_application_1/social_app/views/screens/main_socialapp_screen.dart';
import 'package:flutter_application_1/stateful_lecture/stateful_screen.dart';
import 'package:flutter_application_1/student.dart';
import 'package:flutter_application_1/task_managment/main_tasks_screen.dart';
import 'package:flutter_application_1/task_managment/views/screens/new_task_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FileHelper.initSp();
  runApp(EasyLocalization(
      supportedLocales: [Locale('ar'), Locale('en'), Locale('fr')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: AppInit()));
}

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: AppRouter.navigationKey,
          routes: {
            '/': (context) => WelcomeScreen(),
            'page1': (context) => Page1(),
            'newTaskScreen': (context) => NewTaskScreen(
                (ModalRoute.of(context)!.settings.arguments) as Function),
            'page2': (context) => Page2(
                ModalRoute.of(context)?.settings.arguments.toString() ?? '')
          },
          onGenerateRoute: (RouteSettings settings) {
            String routeName = settings.name ?? '';
            dynamic routeArguments = settings.arguments;
            switch (routeName) {
              case "screen2":
                return MaterialPageRoute(builder: (context) {
                  return Page2(routeArguments.toString());
                });
            }
          },
          onUnknownRoute: (RouteSettings RouteSettings) {
            return MaterialPageRoute(builder: (context) {
              return Scaffold(
                  backgroundColor: Colors.red,
                  body: Center(
                    child: Text('Route ${RouteSettings.name ?? ''} not found'),
                  ));
            });
          },
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}

class MyFirstUi extends StatelessWidget {
  String imageUrl =
      'https://images.unsplash.com/photo-1663930981910-7a4c077feb85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1828&q=80';
  String imageUrl2 = "https://unsplash.com/photos/ea1E5cxVjgg";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('GSK west bank'),
        ),
        /*
        to add images from assets to your UI
        1- create new folder in your main project path
        2- put the images in the created folder
        3- add your folder path to asset in pubspec.yaml
        4- use image.asset to display the image
        */
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/image1.jpg'),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text('Ahmed Hassan'), Text('Since 23 minuites')],
                  )
                ],
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('images/image1.jpg'))),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: const [
                  Icon(
                    Icons.favorite,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.share,
                    size: 30,
                  )
                ],
              ),
            ),
            Text('Hello this is my first post')
          ],
        ));
  }
}
// vs code plugin to display images in compile time
// image_preview

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: news.map((e) {
          return Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  e['urlToImage'] ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (x, y, z) {
                    return Image.asset(
                      'images/image1.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e['title'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(e['description']),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              )
            ],
          );
        }).toList()),
      ),
    );
  }
}
