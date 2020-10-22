import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:tflite/tflite.dart';

//  --------  GIFFY  -------- FUNCTION -----
show_dialogue(context) {
  var screenSize = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: screenSize.height,
          height: screenSize.width,
          child: AssetGiffyDialog(
            image: Image.asset('assets/help_stick.gif', fit: BoxFit.cover),
            title: Text("Guide",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            description: Text(
              "Perform your daily Yoga in the most perfect form and posture easily by analysing your videos and we will take care of the rest",
              textAlign: TextAlign.center,
            ),
            entryAnimation: EntryAnimation.BOTTOM,
            onOkButtonPressed: () => Navigator.of(context).pop(),
            onlyOkButton: true,
          ),
        );
      });
}




class HomePage extends StatefulWidget {
  final List cameras;
  HomePage(this.cameras);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  bool selected = false;


  loadModel() async{
   String res = await Tflite.loadModel(
        model: 'assets/posenet_mv1_075_float_from_checkpoints.tflite'
   );
  }


//
//  setRecognitions(recognitions) {
//    setState(() {
//      _recognitions = recognitions;
//    });
//  }



  @override
  Widget build(BuildContext context) {
    loadModel();
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () => {show_dialogue(context)},
              iconSize: 30.0,
              tooltip: "Help",
              icon: Icon(Icons.help),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white10,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/Camera');
        },
        backgroundColor: Colors.green,
        tooltip: 'Camera',
        child: const Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white12,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 70.0,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenSize.width / 1.5,
              height: screenSize.height / 7,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.purple[300],
                  padding: EdgeInsets.all(15.0),
                  onPressed: (){
                    Navigator.pushNamed(context, '/All Workouts');
                  },
                  child: Text('All Workouts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ))),
            ),
            Container(
              width: screenSize.width / 1.5,
              height: screenSize.height / 7,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.purple[300],
                  padding: EdgeInsets.all(15.0),
                  onPressed: (){},
                  child: Text('Analyse a video',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
