import 'package:demo_srapp/models/patron.model.dart';
import 'package:flutter/material.dart';

class AppLogin extends ChangeNotifier {
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
