import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';


class CameraScreen extends StatefulWidget {
  final List cameras;

  CameraScreen(this.cameras);

  @override
  _CameraScreen createState() => _CameraScreen();
}

class _CameraScreen extends State<CameraScreen> {
  CameraController controller;
  bool isDetecting = false;

  @override
  void initState() {
    super.initState();

    if (widget.cameras == null || widget.cameras.length < 1) {
      print('No camera is found');
    } else {
      controller = new CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
        controller.startImageStream((CameraImage img){
          if(!isDetecting){
            isDetecting = true;

            Tflite.runPoseNetOnFrame(
              bytesList: img.planes.map((plane) {
                return plane.bytes;
              }).toList(),
              imageHeight: img.height,
              imageWidth: img.width,
              numResults: 2,
            ).then((recognitions) {
              setState(() {
                print("SET STATE");
              });
              isDetecting = false;
            });
          }
        });

      });
    }
  }



  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }



  //      B   U   I   L   D           M    E    T    H    O    D
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }

    return OverflowBox(
      maxHeight: screenSize.height/1.2,
      maxWidth: screenSize.width/1.2,
      child: CameraPreview(controller),
    );
  }














}











