import 'package:demo_srapp/models/patron.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  Patron? _patron;

  Patron? get patron {
    return _patron;
  }

  void login(Patron? patron) {
    _patron = patron;
    notifyListeners();
  }

  void logout() {
    _patron = null;
    notifyListeners();
  }
}
