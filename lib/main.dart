import 'package:flutter/material.dart';
import 'package:party_hub/screens/home_screen.dart';
//import 'package:party_hub/screens/login_screen.dart';
//import 'package:party_hub/widgets/bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    title: 'Party Hub',
    theme: ThemeData(
    splashColor: Colors.transparent,),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}