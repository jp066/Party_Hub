import 'package:flutter/material.dart';
import 'package:sos_central/features/home/widgets/home_slider.dart';
import 'package:sos_central/screens/inserir_evento.dart';
import 'package:sos_central/screens/temperatura_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTemperatureScreenVisible = false;

  void _toggleTemperatureScreen() {
    setState(() {
      _isTemperatureScreenVisible = !_isTemperatureScreenVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: <Widget>[
          TextButton(
            child: const Text('Tempo',
                style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Dm_sans',
                    fontWeight: FontWeight.bold)),
            onPressed: _toggleTemperatureScreen,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      
body: Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20), // Define o raio da borda aqui
  ),
  child: Stack(
        children: [
          const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeSlider(),
                  // Adicione mais widgets aqui conforme necessário
                ],
              ),
            ),
          ),
          if (_isTemperatureScreenVisible)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleTemperatureScreen,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: const TelaDeTemperatura(),
                    ),
                  ),
                ),
              ),
            ),
        ],
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
