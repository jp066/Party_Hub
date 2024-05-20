import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/screens/abertura.dart';
import 'package:sos_central/services/autenticador.dart';
import 'package:sos_central/widgets/auth_check.dart';
import 'package:sos_central/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AutenticacaoServico()),
      ],
      child: MaterialApp(
        title: 'SOS Cental',
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: const TelaAbertura(), 
      )));
}