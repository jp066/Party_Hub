import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/screens/abertura.dart';
import 'package:sos_central/servicos/autenticador.dart';
import 'package:sos_central/widgets/auth_check.dart';
//import 'package:party_hub/screens/login_screen.dart';
//import 'package:party_hub/widgets/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AutenticacaoServico()),
      ],
      child: MaterialApp(
        title: 'SOS Cental',
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: const AuthCheck(),
      )));
}
