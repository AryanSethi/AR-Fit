import 'package:flutter/material.dart';

class Keypoints extends StatelessWidget{
  List<dynamic> results;
  Keypoints(this.results);

  @override
  Widget build(BuildContext context) {
    print("INTO KEYPOINTS WIDGET");
    print(results);
    return Text(
      "Hellow"
    );

  }
}