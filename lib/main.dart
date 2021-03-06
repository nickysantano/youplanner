import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:youplanner/shared/shared.dart';
import 'package:youplanner/ui/pages/pages.dart';
import 'package:flutter/material.dart';

void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async{
  enablePlatformOverrideForDesktop();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    Phoenix(
      child: MyApp()
    ),
  );
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
        EditProfile.routeName: (context) => EditProfile(),
        // 'history': (context) => History(),
      },
    );
  }
}