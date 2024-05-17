import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/main%20screen/main_screen.dart';
import 'package:sos_central/servicos/autenticador.dart';
import 'package:sos_central/screens/login_screen.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AutenticacaoServico authCheck = Provider.of<AutenticacaoServico>(context);

    if (authCheck.isLoading) return loading();
    else if (authCheck.usuario == null) return LoginScreen();
    else return MainScreen();
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
