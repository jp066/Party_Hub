import 'package:flutter/material.dart';
import 'package:sos_central/page/main_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final nomeController = TextEditingController();

  void navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/sos-logo-fundo-preto.png'),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
                const Text(
                  'SOS Central',
                  style: TextStyle(
                    fontFamily: 'Dm_sans',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 50, 47),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'DDD + Telefone',
                    labelStyle: TextStyle(
                      fontFamily: 'Dm_sans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 50, 47),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 50, 47),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 50, 47),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    fontFamily: 'Dm_sans',
                    color: Color.fromARGB(255, 255, 50, 47),
                  ),
                ),

                const SizedBox(height: 20), // Espaço entre o campo ID e a senha
                TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(
                      fontFamily: 'Dm_sans',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 50, 47),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 50, 47),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 50, 47),
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 50, 47),
                  ),
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 50, 47),
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    minimumSize:
                        Size(200, 50), // Increase the size of the button
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 50, 47),
                        fontSize: 20,
                        fontFamily: 'Dm_sans',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    navigateToHomeScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
