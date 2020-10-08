import 'package:Smart_Workouts/image_picker.dart';
import 'package:Smart_Workouts/workouts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Smart_Workouts/splashscreen.dart';
import 'package:Smart_Workouts/camera.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black
     )
    );

    return MaterialApp(
      title: "Pose Estimation",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/Camera': (context) => CameraScreen(),
        '/All Workouts':(context) => Workouts(),
      },
    );
  }
}