import 'package:flutter/material.dart';
import 'package:party_hub/screens/criar_evento.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Próximos eventos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Add your code here to display the upcoming events
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your code here to navigate to other parts of the app
              },
              child: const Text('Explore'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateEventPage()),
                );
                },
                child: const Text('Criar Evento'),
            ),
        ],
        ),
      ),
    );
  }
}