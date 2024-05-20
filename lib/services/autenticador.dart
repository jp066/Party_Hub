import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AutenticacaoServico extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  cadastroUsusario() {
    _authCheck();
  }

  _authCheck() {
    _firebaseAuth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _firebaseAuth.currentUser;
    notifyListeners();
  }

  AutenticacaoServico() {
    _authCheck();
  }

  registrar(String email, String senha) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('Senha fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('Email já cadastrado');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não cadastrado. cadastre-se');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _firebaseAuth.signOut();
    _getUser();
  }
}
