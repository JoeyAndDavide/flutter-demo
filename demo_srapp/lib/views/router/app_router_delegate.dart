import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  AppRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return Navigator(key: navigatorKey);
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
