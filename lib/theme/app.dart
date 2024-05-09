import 'package:flutter/material.dart';
import 'package:sos_central/theme/app_colors.dart';

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
      home: const ,
    );
  }
}