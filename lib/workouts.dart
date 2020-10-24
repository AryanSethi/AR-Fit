import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Smart_Workouts/colors.dart';
import 'dart:math';

var workout_descriptions = {
  "Mountain Pose" : "Improve your posture and body awareness. Strengthen your legs and establish good alignment.",
  "Raised Arms Pose" : "Improve your digestion and tone the muscles of the abdomen. Easy pose but highly effective.",
  "Standing Forward Bend" : "Calm your mind and get rid of all the stress. Make your legs stronger too.",
  "Garland Pose" : "Aid your Digestion and strengthen your metabolism.",
  "Lunge" : "Increase your stability and hip flexibility. Build a stronger and more stable core.",
  "Plank" : "Build a stronger and more stable posture along with astronger bdominal muscles.",
  "Seated Forward Bend" : "Relieve your stress, anxiety and fatigue. Improve your overall body strength",
};

List random_colors = [purple,yellow,red,red2,blue,blue2,orange,green,brown];

create_card(context, String workout) {
  Random random = new Random();
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
            color: random_colors[random.nextInt(8)],
          ),
          padding: EdgeInsets.all(15.0),
          child: Wrap(
            direction: Axis.horizontal,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  workout,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 19
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 2, 0, 0),
                  child: Text(
                    workout_descriptions[workout],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13
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
