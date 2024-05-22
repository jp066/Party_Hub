import 'package:flutter/material.dart';
//?import 'package:sos_central/features/home/widgets/home_heading.dart';
import 'package:sos_central/features/home/widgets/home_slider.dart';
import 'package:sos_central/screens/inserir_evento.dart';
//?import 'package:sos_central/screens/login_screen.dart';
import 'package:sos_central/screens/temperatura_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Home',
            style: TextStyle(
                color: Colors.red,
                fontFamily: 'Dm_sans',
                fontWeight: FontWeight.bold)),
        actions: <Widget>[
          TextButton(
            child: const Text('Tempo',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Dm_sans',
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TelaDeTemperatura()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeSlider(),
            ],
          ),
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InserirAlerta()),
          );
        },
        child: const Icon(Icons.add, color: Colors.black),
        shape: const CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 134, 2, 0),
      ),
    );
  }
}
