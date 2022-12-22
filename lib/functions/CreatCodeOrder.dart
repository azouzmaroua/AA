//===========================================================================================
//function creat my code

import 'dart:math';

List<String> latter26 = [
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

Future creatCodeOrder() async {
  String myCode =
      await "${latter26[Random().nextInt(25)]}${latter26[Random().nextInt(25)]}${Random().nextInt(100000)}";
  return myCode;
}
