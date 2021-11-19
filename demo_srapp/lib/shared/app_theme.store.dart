import 'package:demo_srapp/theme/apex.theme.dart';
import 'package:demo_srapp/theme/base.theme.dart';

import 'package:flutter/material.dart';

enum AppThemeType { base, apex }

class AppTheme extends ChangeNotifier {
  AppThemeType _currentThemeType = AppThemeType.base;

  void changeThemeType(AppThemeType themeType) {
    _currentThemeType = themeType;
    notifyListeners();
  }

  BaseTheme get currentTheme {
    switch (_currentThemeType) {
      case AppThemeType.apex:
        return ApexTheme();
      default:
        return BaseTheme();
    }
  }
}
