import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/views/router/app_page_action.dart';
import 'package:flutter/material.dart';

// Singleton class that contains the states of the App
class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  factory AppState() {
    return _instance;
  }

  AppState._internal();

  AppPageAction _nextAppPageAction = AppPageAction();
  AppPageAction get nextAppPageAction => _nextAppPageAction;
  set nextAppPageAction(value) {
    _nextAppPageAction = value;
    notifyListeners();
  }

  clearAppPageAction() {
    _nextAppPageAction = AppPageAction();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  AppThemeType? _appThemeType;
  AppThemeType get appThemeType => _appThemeType ?? AppThemeType.gold1;
  setLoggedInAndAppTheme(AppThemeType appThemeType) {
    _loggedIn = true;
    _appThemeType = appThemeType;
    notifyListeners();
  }

  setLoggedOut() {
    _loggedIn = false;
    _appThemeType = null;
    notifyListeners();
  }
}
