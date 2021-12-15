import 'package:demo_srapp/router/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppRouterInformationParser extends RouteInformationParser<AppPageStacks> {
  @override
  Future<AppPageStacks> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');

    /*
    // handle '/'
    if (uri.pathSegments.isEmpty) {
      return SynchronousFuture<AppPageConfig>(AppPageConfig.profile());
    }

    // handle first level
    if (uri.pathSegments.length == 1) {
      final part1 = uri.pathSegments[0];
      switch (part1) {
        case AppPagePath.splash:
          return SynchronousFuture<AppPageConfig>(AppPageConfig.splash());
        case AppPagePath.login:
          return SynchronousFuture<AppPageConfig>(AppPageConfig.login());
        case AppPagePath.profile:
          return SynchronousFuture<AppPageConfig>(AppPageConfig.profile());
      }
    }
    */

    // unhandded path
    return SynchronousFuture<AppPageStacks>(AppPageStacks());
  }

  @override
  RouteInformation restoreRouteInformation(configuration) {
    final location =
        configuration.stack.fold<String>("", (previousValue, element) {
      if (element.id == null) {
        return "$previousValue/${element.path}";
      } else {
        return "$previousValue/${element.path}/${element.id}";
      }
    });

    return RouteInformation(location: location);
  }
}
