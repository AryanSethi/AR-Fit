import 'package:Smart_Workouts/camera.dart';
import 'package:Smart_Workouts/workouts.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Smart_Workouts/splashscreen.dart';

List<CameraDescription> cameras;

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
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
        primarySwatch: Colors.green
      ),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/All Workouts':(context) => Workouts(),
        '/Camera':(context)=> CameraScreen(cameras)
      },
    );
  }
}