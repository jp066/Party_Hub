import 'package:firebase_core/firebase_core.dart';
import 'package:sos_central/app.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sos_central/services/autenticador.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AutenticacaoServico()),
      ],
      child: const App(),
    ),
  );
}
