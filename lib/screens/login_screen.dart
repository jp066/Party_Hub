import 'package:flutter/material.dart';
import 'package:sos_central/main%20screen/main_screen.dart';
import 'package:sos_central/servicos/autenticador.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  void navigateToHomeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(),
      ),
    );
  }

  void initState() {
    super.initState();
//    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (emailController.text.isEmpty || senhaController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: const Text('Preencha todos os campos'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (senhaController.text.length < 6) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Erro'),
              content: const Text('Senha deve ter no mínimo 6 caracteres'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
      else if (!isLogin){
        _autenticacaoServico.criarConta(emailController.text, senhaController.text);
        navigateToHomeScreen();
      }
      else {
        _autenticacaoServico.entrar(emailController.text, senhaController.text);
        navigateToHomeScreen();
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              key: formKey,
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
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email@exemplo.com',
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
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 20), // Espaço entre o campo ID e a senha
                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: '******',
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
                        const Size(200, 50), // Increase the size of the button
                  ),
                  child: const Text(
                      'Entrar',
                    style:  TextStyle(
                        color: Color.fromARGB(255, 255, 50, 47),
                        fontSize: 20,
                        fontFamily: 'Dm_sans',
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    setFormAction(true);
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setFormAction(!isLogin);
                  },
                  child: const Text(
                    'Cadastre-se',
                    style:  TextStyle(
                        color: Color.fromARGB(255, 255, 50, 47),
                        fontSize: 20,
                        fontFamily: 'Dm_sans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
