import 'package:flutter/material.dart';
import 'package:sos_central/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: const Text(
              'Login',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 50, 47),
                fontFamily: "Dm_sans",
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
