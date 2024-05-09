import 'package:flutter/material.dart';
import 'package:sos_central/screens/home_screen.dart';

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
        backgroundColor: Colors.white24, // Adicionando background color preto
        title: const Text('Party Hub'),
        titleTextStyle: const TextStyle(
          color: Color(0xFFfca311),
          fontFamily: 'Dm_sans',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white24,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/icons/Ingresse_logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      labelText: 'ID',
                      labelStyle: TextStyle(
                        fontFamily: 'Dm_sans',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfca311),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Dm_sans',
                      color: Color(0xFFfca311),
                    ),
                  ),

                  const SizedBox(
                      height: 20), // Espaço entre o campo ID e a senha
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        fontFamily: 'Dm_sans',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFfca311),
                      ),
                    ),
                    style: const TextStyle(
                        color: Color(
                            0xFFfca311)), // Adicionando cor branca ao digitar
                    obscureText: true,
                  ),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF00A5DB),
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      minimumSize:
                          Size(200, 50), // Increase the size of the button
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          color: Colors.grey[100],
                          fontSize: 20,
                          fontFamily: 'Dm_sans',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      navigateToHomeScreen();
                    },
                  ),
                ],),
          ),
        ),
      ),
    );
  }
}


// cor_azul: 0xFF00A5DB
// cor_'laranja': 0xFFfca311