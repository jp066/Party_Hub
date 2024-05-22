import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/services/autenticador.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Login';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

//!   login() async {
//!    setState(() => loading = true);
//!    try {
//!      await context.read<AuthService>().login(email.text, senha.text);
//!    } on AuthException catch (e) {
//!      setState(() => loading = false);
//!      ScaffoldMessenger.of(context)
//!          .showSnackBar(SnackBar(content: Text(e.message)));
//!    }
//!  }
//!
//!  registrar() async {
//!    setState(() => loading = true);
//!    try {
//!      await context.read<AuthService>().registrar(email.text, senha.text);
//!    } on AuthException catch (e) {
//!      setState(() => loading = false);
//!      ScaffoldMessenger.of(context)
//!          .showSnackBar(SnackBar(content: Text(e.message)));
//!    }
//!  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Dm_sans',
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: email,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: 'Email',
                      labelStyle:
                          TextStyle(color: Colors.red, fontFamily: 'Dm_sans'),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o email corretamente!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 24.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      labelText: 'Senha',
                      labelStyle:
                          TextStyle(color: Colors.red, fontFamily: 'Dm_sans'),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informa sua senha!';
                      } else if (value.length < 6) {
                        return 'Sua senha deve ter no mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
//!                      if (formKey.currentState!.validate()) {
//!                        if (isLogin) {
//!                          login();
//!                        } else {
//!                          registrar();
//!                        }
//!                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: (loading)
                          ? [
                              const Padding(
                                padding: EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ]
                          : [
                              const Icon(Icons.check, color: Colors.red),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  actionButton,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Dm_sans',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => setFormAction(!isLogin),
                  child: Text(toggleButton,
                      style: const TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}