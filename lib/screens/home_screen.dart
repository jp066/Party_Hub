import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sos Central',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.orangeSwatch
      ),
    );
  }
}
