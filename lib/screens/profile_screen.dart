import 'package:flutter/material.dart';

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
        title: const Center(child: 
        Text("Profile",
        style: TextStyle(
            color: Color(0xFFfca311),
            fontFamily: "Dm_sans",
            fontSize: 25)),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Color(0xFFfca311),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    );
  }
}