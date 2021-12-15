import 'package:demo_srapp/auth_states.dart';
import 'package:demo_srapp/router/app_pages.dart';
import 'package:demo_srapp/views/login/login_page.dart';
import 'package:demo_srapp/views/profile/profile_page.dart';
import 'package:demo_srapp/views/settings/settings_page.dart';
import 'package:demo_srapp/views/splash/splash_page.dart';
import 'package:demo_srapp/views/unknown/unknown_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppPageStacks>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPageStacks> {
  //
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  // States
  final AppPageStacks appPageStacks;
  final AuthStates authStates;

  // Constructor
  AppRouterDelegate(this.appPageStacks, this.authStates);

  @override
  AppPageStacks get currentConfiguration {
    return appPageStacks;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    //TODO:
    String authToken = await authStates.authToken;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: authStates.authToken,
      builder: (context, snapshot) {
        // Not Ready
        if (!snapshot.hasData) {
          appPageStacks.state = AppPageStacksState.splash;
          return _navigator();
        }

        // Ready
        if (snapshot.data == "") {
          appPageStacks.state = AppPageStacksState.login;
          return _navigator();
        }
        appPageStacks.state = AppPageStacksState.main;
        return _navigator();
      },
    );
  }

  Navigator _navigator() {
    return Navigator(
      key: navigatorKey,
      pages: appPageStacks.stack.map(_config2Page).toList(),
      onPopPage: _handlePopPage,
    );
  }

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;

    if (appPageStacks.stack.length > 1) {
      appPageStacks.stack.removeLast();
      return true;
    }
    return false;
  }

  Page _config2Page(AppPageConfig config) {
    switch (config.page) {
      case AppPages.unknown:
        return const UnknownPage();
      case AppPages.splash:
        return const SplashPage();
      case AppPages.login:
        return const LoginPage();
      case AppPages.profile:
        return const ProfilePage();
      case AppPages.settings:
        return const SettingsPage();
    }
  }
}
