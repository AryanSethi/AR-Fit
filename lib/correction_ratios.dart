/// Ratios to be considered. Ones in pairs are symmetric
// (6,14) - (12,16) R1
// (5,13) - (11,15) R2

// (6,14) - (16,10) R3
// (5,13) - (15,9)  R4

// (4,12) - (14,10) R5
// (3,11) - (13,9)  R6

// (6,14) - (12,16) R7
// (5,13) - (12,16) R8

// (15,10) - (16,9) R9

// (13,10) - (14,9) R10


import 'dart:math';

class Correction{
  List<dynamic> _recognitions;
  List<dynamic> _points = []; // List of lists of x,y like ->   [ [x1,y1],[x2,y2],[x3,y3]... ]
  List<double> _ratios;
  String w_n;

  Correction(this._recognitions,this.w_n);

  List<dynamic> find_points(){
    if(_recognitions!=null){
      for(int i=0;i<=16;i++){
        double x= _recognitions[0]['keypoints'][i]['x'];
        double y= _recognitions[0]['keypoints'][i]['y'];
        List<double> temp = [x,y];
        _points.insert(i, temp);
      }
      return _points;
    }
  }

 void print_recs(){
    int i;
    for(i=0;i<=16;i++){
      print('Part ${i} = ${_recognitions[0]['keypoints'][i]['x']}');
      print('Part ${i} = ${_recognitions[0]['keypoints'][i]['y']}');
    }
  }

  String wname(){
    return w_n;
  }

  double distance(double x1, double y1 ,double x2,double y2){
    double s1 = pow((x2-x1).abs(),2);
    double s2 = pow((y1-y1).abs(),2);
    double d= ((s2-s1).abs());
    print('Distance is $d');     //TODO : remove this print statement
    return d;
  }

  mountain_pose(){

  }
}