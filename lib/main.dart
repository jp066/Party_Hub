import 'package:flutter/material.dart';
import 'package:sos_central/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'SOS Cental',
    theme: ThemeData(
    splashColor: Colors.transparent),
    debugShowCheckedModeBanner: false,
    home: MainScreen(),
  ));
}