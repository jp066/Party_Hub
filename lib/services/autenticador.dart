import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExcecaoAutenticador implements Exception {
  String message;
  ExcecaoAutenticador(this.message);
}

class AutenticacaoServico extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AutenticacaoServico() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ExcecaoAutenticador('A senha é muito fraca!');
      } else if (e.code == 'email-already-in-use') {
        throw ExcecaoAutenticador('Este email já está cadastrado');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExcecaoAutenticador('Email não encontrado. Cadastre-se.');
      } else if (e.code == 'wrong-password') {
        throw ExcecaoAutenticador('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}
