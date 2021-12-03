import 'package:demo_srapp/data/auth_repository.dart';
import 'package:demo_srapp/models/patron.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  Patron? _patron;
  bool _loggingIn = false;

  Patron? get patron => _patron;

  bool get loggingIn => _loggingIn;

  Future<void> login(String pid) async {
    _loggingIn = true;
    notifyListeners();
    _patron = await _authRepository.login(pid);
    _loggingIn = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _patron = null;
    notifyListeners();
  }
}
