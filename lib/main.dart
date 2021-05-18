import 'package:youplanner/shared/shared.dart';
import 'package:youplanner/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YouPlanner",
      theme: MyTheme.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        MainMenu.routeName: (context) => MainMenu(),
        Onboard.routeName: (context) => Onboard(),
        AddTask.routeName: (context) => AddTask(),
        MyTask.routeName: (context) => MyTask(),
        TaskDetails.routeName: (context) => TaskDetails(),
        // 'history': (context) => History(),
      },
    );
  }
}