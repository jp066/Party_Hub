import 'package:flutter/material.dart';
import 'package:sos_central/theme/app_colors.dart';

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
