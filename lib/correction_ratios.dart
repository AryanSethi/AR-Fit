/// Ratios to be considered. Ones in pairs are symmetric
// (6,14) - (12,16) R1
// (5,13) - (11,15) R2

// (6,14) - (16,10) R3
// (5,13) - (15,9)  R4

// (4,12) - (14,10) R5
// (3,11) - (13,9)  R6

// (6,16) - (14,10) R7
// (5,15) - (13,9) R8

// (15,10) - (16,9) R9

// (13,10) - (14,9) R10


import 'dart:math';

List<dynamic> ratio_presets=[
  [  [6,14],[12,16]  ],
  [  [5,13],[11,15]  ],
  [  [1,14],[16,10]  ],
  [  [5,13],[15,9]   ],
  [  [4,12],[14,10]  ],
  [  [3,11],[13,9]   ],
  [  [6,16],[14,10]  ],
  [  [5,15],[13,9]   ],
  [  [15,10],[16,9]  ],
  [  [13,10],[14,9]  ]
];

class Correction{
  List<dynamic> _recognitions;
  List<dynamic> _points = []; // List of lists of x,y like ->   [ [x1,y1],[x2,y2],[x3,y3]... ]
  List<double> _ratios;
  String w_n;

  List<double> find_ratios(){

  }

  Correction(this._recognitions,this.w_n){
    if(_recognitions!=null){
      for(int i=0;i<=16;i++){
        double x= _recognitions[0]['keypoints'][i]['x'];
        double y= _recognitions[0]['keypoints'][i]['y'];
        List<double> temp = [x,y];
        _points.insert(i, temp);
      }
    }
  }

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

  String w_name(){
    return w_n;
  }

  double find_distance(double x1, double y1 ,double x2,double y2){
    double s1 = pow((x2-x1).abs(),2);
    double s2 = pow((y1-y1).abs(),2);
    double d= ((s2-s1).abs());
    print('Distance is $d');     //TODO : remove this print statement
    return d;
  }


}