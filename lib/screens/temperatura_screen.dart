import 'package:flutter/material.dart';
import 'dart:ui';

class TelaDeTemperatura extends StatefulWidget {
  const TelaDeTemperatura({super.key});

  @override
  State<TelaDeTemperatura> createState() => _TelaDeTemperaturaState();
}

class _TelaDeTemperaturaState extends State<TelaDeTemperatura> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Scaffold(
          backgroundColor: Colors.black.withOpacity(0.7),
          body: const Center(
            child: Text('Display Temperaturas'),
          ),
        ),
      ),
    );
  }
}