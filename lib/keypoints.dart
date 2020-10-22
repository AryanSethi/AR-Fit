import 'package:flutter/material.dart';

class Keypoints extends StatelessWidget{
  List<dynamic> results;
  var previewH;
  var previewW;

  Keypoints(this.results,this.previewH,this.previewW);

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var screenH = screenSize.height;
    var screenW = screenSize.width;


    List<Widget> _renderKeypoints() {
      var lists = <Widget>[];
      results.forEach((re) {
        var list = re["keypoints"].values.map<Widget>((k) {
          var _x = k["x"];
          var _y = k["y"];
          var scaleW, scaleH, x, y;

          if (screenH / screenW > previewH/previewW) {
            scaleW = screenH / previewH * previewW;
            scaleH = screenH;
            var difW = (scaleW - screenW) / scaleW;
            x = (_x - difW / 2) * scaleW;
            y = _y * scaleH;
          } else {
            scaleH = screenW / previewW * previewH;
            scaleW = screenW;
            var difH = (scaleH - screenH) / scaleH;
            x = _x * scaleW;
            y = (_y - difH / 2) * scaleH;
          }
          return Positioned(
            left: x ,
            top: y,
            width: 120,
            height: 12,
            child: Container(
              child: Text(
                "●",
                style: TextStyle(
                  color: Color.fromRGBO(255, 0, 0, 1.0),
                  fontSize: 12.0,
                ),
              ),
            ),
          );
        }).toList();

        lists..addAll(list);
      });

      return lists;
    }


    return Stack(
      children: _renderKeypoints()
    );
  }
}