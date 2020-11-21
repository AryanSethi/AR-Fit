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
  Correction(this._recognitions);


  print_recs(){
    int i;
    for(i=0;i<=16;i++){
      print('Part ${i} = ${_recognitions[0]['keypoints'][i]['part']}');
    }
  }
}