import 'package:flutter/material.dart';
import 'package:party_hub/screens/criar_evento.dart';
import 'package:party_hub/screens/login_screen.dart';
import 'package:party_hub/screens/explorer_screen.dart';
import 'package:party_hub/screens/profile_screen.dart';

PreferredSizeWidget showBottomBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      icon: Icon(Icons.person),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExplorerScreen()),
          );
        },
        child: const Text('Explore'),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateEventPage()),
          );
        },
        child: const Text('Criar Evento'),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: const Text('Login'),
      ),
    ],
  );
}
