import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:Smart_Workouts/camera.dart';
import 'package:Smart_Workouts/camera.dart';


//  --------  HELP  -------- FUNCTION -----
show_dialogue(context) {
  var screenSize = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: screenSize.height,
          height: screenSize.width,

          child: AssetGiffyDialog(
            image: Image.asset(
              'assets/help_stick.gif',
              fit: BoxFit.cover
            ),
            title: Text("Guide",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
            description: Text(
              "Use the 'Available workouts' button to check out the full collection of workouts\nAnd use the'Analyse a video'Analyse a video' "
                  "button to score the posture of a recorded video.",
              textAlign: TextAlign.center,
            ),
            entryAnimation: EntryAnimation.BOTTOM,
            onOkButtonPressed: ()=> Navigator.of(context).pop(),
            onlyOkButton: true,
          ),
        );
      });
}


Camera_call(context){
  Navigator.pushNamed(context, '/Camera');
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () => {},
                  child: Text('All Workouts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ))),
            ),
            Container(
              width: screenSize.width / 1.5,
              height: screenSize.height / 7,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.all(15.0),
                  onPressed: () => {},
                  child: Text('Analyse a video',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ))),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white10,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Camera_call(context),
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
    );
  }
}
