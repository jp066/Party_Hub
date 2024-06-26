import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sos_central/main/main_screen.dart';

class TelaAbertura extends StatefulWidget {
  const TelaAbertura({super.key});

  @override
  State<TelaAbertura> createState() => _TelaAberturaState();
}

class _TelaAberturaState extends State<TelaAbertura>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, arbritaryRoute);
  }

  arbritaryRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: SizedBox(
                child: Center(
                  child: SizedBox(
                    height: 170,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/sos-logo-removebg-preview.png',
                          height: 150,
                          width: 150,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
