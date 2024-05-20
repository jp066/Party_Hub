import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_central/features/home/widgets/home_heading.dart';
import 'package:sos_central/features/home/widgets/home_slider.dart';
import 'package:sos_central/screens/login_screen.dart';
import 'package:sos_central/screens/temperatura_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea( 
        child: Column(
          children: [
          HomeHeading(
            title: 'Noticias Recentes',          
             trailing: TextButton(
              child: const Text('Tempo', style: TextStyle(color: Colors.red, fontFamily: 'Dm_sans', fontWeight: FontWeight.bold)),
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaDeTemperatura()));
               },
               ),
          ),
          const HomeSlider(),
          const Center(child: Text('Home')),
        ]),
      ),
    );
  }
}
