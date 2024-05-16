import 'package:flutter/material.dart';

class AppColors {
  static const Color orangeRadiance = Color(0xFFfca311);

  static const Color white = Color(0xFFFFFFFF);

  static const Color osloGray = Color(0xFF949A9A);

  static const Color athenasGray = Color.fromRGBO(90, 187, 187, 1);

  static const MaterialColor orangeSwatch = MaterialColor(0xFFfca311, _orangeMap);


  static const Map<int, Color> _orangeMap = {
  50:Color.fromRGBO(252, 163, 17, .9),
  100:Color.fromRGBO(252, 163, 17, .8),
  200:Color.fromRGBO(252, 163, 17, .7),
  300:Color.fromRGBO(252, 163, 17, .6),
  400:Color.fromRGBO(252, 163, 17, .5),
  500:Color.fromRGBO(252, 163, 17, .4),
  600:Color.fromRGBO(252, 163, 17, .3),
  700:Color.fromRGBO(252, 163, 17, .2),
  800:Color.fromRGBO(252, 163, 17, .1),
  900:Color.fromRGBO(252, 163, 17, .0),
};
}