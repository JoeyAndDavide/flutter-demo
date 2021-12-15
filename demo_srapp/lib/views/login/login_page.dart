import 'package:demo_srapp/views/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends Page {
  const LoginPage() : super(key: const ValueKey('Login'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return const LoginView();
        });
  }
}
