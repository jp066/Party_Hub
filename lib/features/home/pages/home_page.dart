import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_central/features/home/widgets/home_heading.dart';
import 'package:sos_central/features/home/widgets/home_slider.dart';
import 'package:sos_central/features/home/widgets/home_top_buttons.dart';
import 'package:sos_central/screens/login_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea( 
        child: Column(
          children: [
          HomeTopButtons(),
          HomeHeading(
            title: 'Noticias Recentes',
             trailing: TextButton(
              child: Text('Tempo'),
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
               },
               ),
          ),
          HomeSlider(),
          Center(child: Text('Home')),
        ]),
      ),
    );
  }
}
