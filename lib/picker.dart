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
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Analyser(file, widget._recognitions)));
     }
    );
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
          child: Text('Analyse a Photo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenSize.width * 0.07,
                color: Colors.black,
              ))),
    );
  }
}


class Analyser extends StatelessWidget{
  File file;
  List<dynamic> _recognitions;
  Analyser(this.file,this._recognitions);

  @override
  Widget build(BuildContext context) {
    var screensize= MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.file(
                file,
                height: screensize.height,
                width: screensize.width,
            ),
          ),
          Keypoints(_recognitions,screensize.height,screensize.width)
        ],
      )
    );
  }
}
