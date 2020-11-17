import 'dart:io';

import 'package:Smart_Workouts/keypoints.dart';
import 'package:Smart_Workouts/workouts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

import 'package:tflite/tflite.dart';

class Picker extends StatefulWidget {
  @override
  _PickerState createState() => _PickerState();
  List<dynamic> _recognitions;
}

class _PickerState extends State<Picker> {
  Random random = new Random();
  String _path;
  FileType _pickingType;
  bool _hasValidMime = false;
  String _extension;
  File file;


  pose_est(String path) async {
    Tflite.runPoseNetOnImage(
      path: path,
    ).then((recognitions) {
      if (mounted) {
        setState(() {
          widget._recognitions = recognitions;
          print(widget._recognitions!=null);
        });
      }
    });
  }

  Future<Widget> _openFileExplorer(context, height, width) async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      try {
        _path = await FilePicker.getFilePath(
            type: _pickingType, fileExtension: _extension);
        file = File(_path);

        pose_est(_path);

      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> test(file, widget._recognitions)));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.7,
      height: screenSize.height * 0.15,
      margin: EdgeInsets.all(20.0),
      child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          color: random_colors[random.nextInt(8)],
          padding: EdgeInsets.all(15.0),
          onPressed: () {
            _openFileExplorer(context, screenSize.height, screenSize.width);
          },
          child: Text('Analyse Photo/Video',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.07,
                color: Colors.black,
              ))),
    );
  }
}


class test extends StatelessWidget{
  File file;
  List<dynamic> _recognitions;
  test(this.file,this._recognitions);

  @override
  Widget build(BuildContext context) {
    var screensize= MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.file(
              file
          ),
          Keypoints(_recognitions,screensize.height,screensize.width)
        ],
      )
    );
  }
}
