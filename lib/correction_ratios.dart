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

List<dynamic> ratio_presets=[     // points that are to be used to find ratios, for eg.
  [  [6,14],[12,16]  ],           // ratio of ( D(6,14) and D(12,16) )   where D(6,14) is the distance between point 6 and 14 in _points list
  [  [5,13],[11,15]  ],
  [  [6,14],[16,10]  ],
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

  Correction(this._recognitions,this.w_n){
    if(_recognitions!=null){
      for(int i=0;i<=16;i++){
        double x= _recognitions[0]['keypoints'][i]['x'];
        double y= _recognitions[0]['keypoints'][i]['y'];
        List<double> temp = [x,y];
        _points.insert(i, temp);
      }
      print(_points);
    }
  }

  List<double> find_ratios(){
    List<double> ratios=[];
    for(int ratio_preset=0;ratio_preset<=9;ratio_preset++){
      List p1=_points[ratio_presets[ratio_preset][0][0]-1];
      List p2=_points[ratio_presets[ratio_preset][0][1]-1];
      List p3=_points[ratio_presets[ratio_preset][1][0]-1];
      List p4=_points[ratio_presets[ratio_preset][1][1]-1];

      double d1 = find_distance(p1[0],p1[1],p2[0],p2[1]);
      double d2 = find_distance(p3[0],p3[1],p4[0],p4[1]);
      double ratio = d1/d2;
      ratios.insert(ratio_preset, ratio);
    }
    return ratios;
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
    double s1 = (x2-x1).abs();
    double s2 = (y2-y1).abs();
    double d= ((s2-s1).abs());
    return d;
  }


}