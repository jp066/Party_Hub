import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AutenticacaoServico extends ChangeNotifier {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  cadastroUsusario() {
    _authCheck();
  }
  
  _authCheck() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Usuário não logado');
        isLoading = false;
        notifyListeners();
      } else {
        print('Usuário logado');
        usuario = user;
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
