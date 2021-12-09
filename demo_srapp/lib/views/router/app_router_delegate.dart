import 'package:demo_srapp/app_state.dart';
import 'package:demo_srapp/views/router/app_page_action.dart';
import 'package:demo_srapp/views/router/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterDelegate extends RouterDelegate<AppPageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPageConfiguration> {
  //
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  final AppState appState = AppState();

  // the page stack
  final List<Page> _pages = [];
  List<MaterialPage> get pages => List.unmodifiable(_pages);

  AppRouterDelegate() {
    appState.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appState.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        if (_canPop()) return true;
        return false;
      },
      pages: _buildPages(),
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    _pages.clear();
    _pages.add(configuration.page);
    return SynchronousFuture(null);
  }

  @override
  Future<bool> popRoute() {
    _pop();
    return SynchronousFuture(_canPop());
  }

  // Helper functions
  bool _canPop() {
    return _pages.length > 1;
  }

  void _pop() {
    if (_canPop()) {
      _pages.removeLast();
    }
  }

  void _addPage(AppPageConfiguration newPage) {
    if (_pages.isEmpty ||
        (_pages.last.arguments as AppPageConfiguration).appPage !=
            newPage.appPage) {
      _pages.add(newPage.page);
    }
  }

  void _addPagesFromAppState() {
    for (AppPageConfiguration page in appState.nextAppPageAction.pages!) {
      _addPage(page);
    }
  }

  List<Page> _buildPages() {
    if (_pages.isEmpty) {
      _addPage(AppPageCollection.splashPageConfig);
    } else {
      switch (appState.nextAppPageAction.action) {
        case AppPageActions.none:
          break;
        case AppPageActions.addPages:
          _addPagesFromAppState();
          break;
        case AppPageActions.pop:
          _pop();
          break;
        case AppPageActions.replace:
          if (_pages.isNotEmpty) {
            _pages.removeLast();
          }
          _addPagesFromAppState();
          break;
        case AppPageActions.replaceAll:
          _pages.clear();
          _addPagesFromAppState();
          break;
      }
      appState.clearAppPageAction();
    }
    return pages;
  }
}
