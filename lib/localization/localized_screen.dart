import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr()),
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale == Locale('ar')) {
                  context.setLocale(Locale('en'));
                } else {
                  context.setLocale(Locale('ar'));
                }
              },
              icon: Icon(Icons.language))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [Text('course_label'.tr()), Text('course_name'.tr())],
          ),
          Row(
            children: [Text('locaation_label'.tr()), Text('location'.tr())],
          )
        ],
      ),
    );
  }
}
