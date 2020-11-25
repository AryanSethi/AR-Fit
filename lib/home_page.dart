import 'package:Smart_Workouts/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:Smart_Workouts/colors.dart';
import 'dart:math';

List random_colors = [
  purple,
  yellow,
  red,
  red2,
  blue,
  blue2,
  orange,
  green,
  brown
];

/// GIFFY FUNCTION
show_dialogue(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.all(2.0),
          child: AssetGiffyDialog(
            image: Image.asset('assets/help_stick.gif', fit: BoxFit.cover),
            title: Text("Keep in Mind",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800
                )
            ),
            description: Text(
              "● Only one person should be in frame\n● Use Portrait Mode only\n● Recording should be done as instructed",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0
              ),
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
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
//  name_fetcher() async{
//    String user;
//    final prefs = await SharedPreferences.getInstance();
//
//    prefs.getString('name') == null ?
//    user='User':
//    user = prefs.getString('name');
//    return user;
//  }

  Random random = new Random();

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

              /// HELP ICON
              iconSize: 30.0,
              tooltip: "Help",
              icon: Icon(Icons.help),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white10,
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
              width: screenSize.width * 0.5,
              height: screenSize.height * 0.15,
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: random_colors[random.nextInt(8)],
                  padding: EdgeInsets.all(15.0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/All Workouts');

                    /// All WORKOUTS
                  },
                  child: Text('All Workouts',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.07,
                        color: Colors.black,
                      ))),
            ),
            Picker()

            /// ANALYSE PHOTO/VIDEO
          ],
        ),
      ),
    );
  }
}
