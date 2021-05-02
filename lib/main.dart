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
      title: "Advanced MAD",
      theme: MyTheme.lightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => MainMenu(),
        MainMenu.routeName: (context) => MainMenu(),
        Onboard.routeName: (context) => Onboard(),
        // 'history': (context) => History(),
      },
    );
  }
}