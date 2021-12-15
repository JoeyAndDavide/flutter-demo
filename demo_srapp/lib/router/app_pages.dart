import 'package:flutter/material.dart';

enum AppPages {
  unknown,
  splash,
  login,
  profile,
  settings,
}

abstract class AppPagePaths {
  static const String unknown = '404';
  static const String splash = 'splash';
  static const String login = 'login';
  static const String profile = 'profile';
  static const String settings = 'settings';
}

class AppPageConfig {
  final AppPages page;
  final String path;
  final bool requiredLogin;
  int? id;

  AppPageConfig.unknown()
      : page = AppPages.unknown,
        path = AppPagePaths.unknown,
        requiredLogin = false,
        id = null;

  AppPageConfig.splash()
      : page = AppPages.splash,
        path = AppPagePaths.splash,
        requiredLogin = false,
        id = null;

  AppPageConfig.login()
      : page = AppPages.login,
        path = AppPagePaths.login,
        requiredLogin = false,
        id = null;

  AppPageConfig.profile()
      : page = AppPages.profile,
        path = AppPagePaths.profile,
        requiredLogin = true,
        id = null;

  AppPageConfig.settings()
      : page = AppPages.settings,
        path = AppPagePaths.settings,
        requiredLogin = true,
        id = null;
}

enum AppPageStacksState {
  splash,
  login,
  main,
}

class AppPageStacks extends ChangeNotifier {
  final List<AppPageConfig> _splashStack = [AppPageConfig.splash()];
  final List<AppPageConfig> _loginStack = [AppPageConfig.login()];
  final List<AppPageConfig> _mainStack = [AppPageConfig.profile()];

  AppPageStacksState _state;
  AppPageStacksState get state => _state;
  set state(value) {
    _state = value;
  }

  AppPageStacks() : _state = AppPageStacksState.splash;

  List<AppPageConfig> get stack {
    switch (state) {
      case AppPageStacksState.splash:
        return _splashStack;
      case AppPageStacksState.login:
        return _loginStack;
      case AppPageStacksState.main:
        return _mainStack;
    }
  }
}
