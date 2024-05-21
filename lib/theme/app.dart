import 'package:flutter/material.dart';
import 'package:sos_central/main%20screen/main_screen.dart';
import 'package:sos_central/theme/app_colors.dart';


void main(){
  runApp(MaterialApp(
    title: 'SOS Cental',
    theme: ThemeData(
    splashColor: Colors.transparent),
    debugShowCheckedModeBanner: false,
    home: const MyWidget(),));
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Central',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.orangeRadiance,
      ),
      home: MainScreen(),
    );
  }
}