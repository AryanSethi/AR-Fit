import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:pose_est_app/home_page.dart';

class MySplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<MySplashScreen>{

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      backgroundColor: Colors.black,
      image: Image.asset('assets/stick-f.png',),
      photoSize: 100.0,
      title: Text(
        'Smart Workouts',
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0
        ),
      ),
      loaderColor: Colors.green,
      navigateAfterSeconds: HomePage(),
    );
  }
}

