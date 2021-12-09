import 'package:demo_srapp/views/login_view.dart';
import 'package:demo_srapp/views/profile_view.dart';
import 'package:demo_srapp/views/splash_view.dart';
import 'package:flutter/material.dart';

enum AppPages {
  splash,
  login,
  profile,
}

class AppPageConfiguration {
  final AppPages appPage;
  final String key;
  final String path;

  AppPageConfiguration({
    required this.appPage,
    required this.key,
    required this.path,
  });

  Widget get view {
    switch (appPage) {
      case AppPages.splash:
        return const SplashView();
      case AppPages.login:
        return const LoginView();
      case AppPages.profile:
        return const ProfileView();
    }
  }

  MaterialPage get page {
    return MaterialPage(
      child: view,
      key: ValueKey<String>(key),
      name: path,
      arguments: this,
    );
  }
}

abstract class AppPageCollection {
  static final splashPageConfig = AppPageConfiguration(
    appPage: AppPages.splash,
    key: 'Splash',
    path: '/splash',
  );

  static final loginPageConfig = AppPageConfiguration(
    appPage: AppPages.login,
    key: 'Login',
    path: '/login',
  );

  static final profilePageConfig = AppPageConfiguration(
    appPage: AppPages.profile,
    key: 'Profile',
    path: '/profile',
  );
}
