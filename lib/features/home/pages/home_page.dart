import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sos_central/features/home/widgets/home_top_buttons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(children: [
          HomeTopButtons(),
          Center(child: Text('Home')),
        ]),
      ),
    );
  }
}
