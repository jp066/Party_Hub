import 'package:flutter/material.dart';
import 'package:sos_central/screens/beggin_screen.dart';
import 'package:sos_central/screens/home_screen.dart';
void main() {
  runApp(MaterialApp(
    title: 'SOS Cental',
    theme: ThemeData(
    splashColor: Colors.transparent),
    debugShowCheckedModeBanner: false,
    home: const BeginScreen(),
  ));
}