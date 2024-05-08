import 'package:flutter/material.dart';
import 'package:party_hub/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Party Hub',
    theme: ThemeData(
    splashColor: Colors.transparent,),
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}