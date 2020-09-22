import 'package:flutter/material.dart';
import 'package:pose_est_app/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pose Estimation",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MySplashScreen(),
    );
  }
}