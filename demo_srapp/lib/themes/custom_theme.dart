import 'package:demo_srapp/themes/custom_colors.dart';
import 'package:flutter/material.dart';

enum ThemeType { base, gold1, ruby2 }

class CustomTheme extends ChangeNotifier {
  ThemeType _currentThemeType = ThemeType.base;

  void changeThemeType(ThemeType themeType) {
    _currentThemeType = themeType;
    notifyListeners();
  }

  BaseTheme get theme {
    switch (_currentThemeType) {
      case ThemeType.gold1:
        return Gold1Theme();
      case ThemeType.ruby2:
        return Ruby2Theme();
      default:
        return BaseTheme();
    }
  }
}

class BaseTheme {
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: CustomColors.lightgrey,
      backgroundColor: Colors.white,
      primaryColor: CustomColors.lightgold);
  TextStyle get profileBodyText1 => const TextStyle(color: Colors.white);
}

class Gold1Theme extends BaseTheme {}

class Ruby2Theme extends BaseTheme {}
