import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:party_hub/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final idController = TextEditingController();
  final passwordController = TextEditingController();

  void navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Adicionando background color preto
        title: const Text('Party Hub'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontFamily: 'Dm_sans',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black, // Adicionando background color preto
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20), // Espaço entre o ícone e o campo ID
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'ID',
                    labelStyle: TextStyle(
                        fontFamily: 'Dm_sans', fontWeight: FontWeight.bold),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Dm_sans',
                      color: Colors.white), // Adicionando cor branca ao digitar
                ),

                const SizedBox(height: 20), // Espaço entre o campo ID e a senha
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                        fontFamily: 'Dm_sans', fontWeight: FontWeight.bold),
                  ),
                  style: const TextStyle(
                      fontFamily: 'Dm_sans',
                      color: Colors.white), // Adicionando cor branca ao digitar
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                        color: Colors.grey,
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
