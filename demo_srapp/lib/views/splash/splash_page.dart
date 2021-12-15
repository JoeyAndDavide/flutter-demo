import 'package:demo_srapp/views/splash/splash_view.dart';
import 'package:flutter/material.dart';

class SplashPage extends Page {
  const SplashPage() : super(key: const ValueKey('Splash'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return const SplashView();
      },
    );
  }
}
