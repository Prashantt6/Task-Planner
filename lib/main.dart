import 'package:flutter/material.dart';
import 'package:to_do_list/Todaytaskscreen.dart';
import 'package:to_do_list/homescreen.dart';
import 'package:to_do_list/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task planner',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), // Changed to SplashScreen
    );
  }
}
