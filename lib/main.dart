import 'package:flutter/material.dart';
import 'package:sos_central/screens/abertura.dart';
//import 'package:party_hub/screens/login_screen.dart';
//import 'package:party_hub/widgets/bottom_bar.dart';

void main() {
  runApp(MaterialApp(
    title: 'SOS Cental',
    theme: ThemeData(splashColor: Colors.transparent),
    debugShowCheckedModeBanner: false,
    home: const BegginScreen(),
  ));
}