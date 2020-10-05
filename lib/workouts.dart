import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var workout_descriptions = {
  "Mountain Pose" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Raised Arms Pose" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Standing Forward Bend" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Garland Pose" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Lunge" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Plank" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
  "Seated Forward Bend" : "THE bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla ",
};

create_card(context, String workout) {
  var screenSize = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.all(5.0),
    margin: EdgeInsets.all(3.0),
    width: screenSize.width,
    height: screenSize.height / 5,
    child: GestureDetector(
      onTap: ()=>{},
      child: Card(
        color: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.blueGrey[600],
          ),
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  workout,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 25
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                  child: Text(
                    workout_descriptions[workout],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 15
                    ),
                  )
              )
            ],
          ),
        )
      ),
    ),
  );
}

class Workouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All Workouts",
        ),
      ),
      backgroundColor: Colors.white10,
      body: Container(
          child: ListView(
        children: [
          create_card(context, "Mountain Pose"),
          create_card(context, "Raised Arms Pose"),
          create_card(context, "Standing Forward Bend"),
          create_card(context, "Garland Pose"),
          create_card(context, "Lunge"),
          create_card(context, "Plank"),
          create_card(context, "Seated Forward Bend"),
        ],
      )),
    );
  }
}
