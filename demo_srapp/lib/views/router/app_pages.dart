import 'package:demo_srapp/views/login_view.dart';
import 'package:demo_srapp/views/profile_view.dart';
import 'package:flutter/material.dart';

enum AppPages {
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
  static final loginPageCofig = AppPageConfiguration(
    appPage: AppPages.login,
    key: 'Login',
    path: '/login',
  );

  static final profilePageCofig = AppPageConfiguration(
    appPage: AppPages.profile,
    key: 'Profile',
    path: '/profile',
  );
}
