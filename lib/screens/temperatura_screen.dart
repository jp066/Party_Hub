import 'package:flutter/material.dart';

class TelaDeTemperatura extends StatefulWidget {
  const TelaDeTemperatura({super.key});

  @override
  State<TelaDeTemperatura> createState() => _TelaDeTemperaturaState();
}

class _TelaDeTemperaturaState extends State<TelaDeTemperatura> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperaturas'),
      ),
      body: Center(
        child: Text('Display Temperaturas'),
      ),
    );
  }
}