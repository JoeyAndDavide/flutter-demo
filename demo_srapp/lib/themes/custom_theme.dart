import 'package:demo_srapp/themes/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  static bool _isDarkTheme = false;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: CustomColors.lightgrey,
      backgroundColor: Colors.white,
      primaryColor: CustomColors.lightgold,
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
    );
  }
}
