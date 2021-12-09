import 'package:demo_srapp/views/router/app_pages.dart';
import 'package:flutter/material.dart';

class AppRouterInformationParser
    extends RouteInformationParser<AppPageConfiguration> {
  @override
  Future<AppPageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');

    if (uri.pathSegments.isNotEmpty) {
      final path = '/' + uri.pathSegments[0];
      if (path == AppPageCollection.loginPageCofig.path) {
        return AppPageCollection.loginPageCofig;
      }
      if (path == AppPageCollection.profilePageCofig.path) {
        return AppPageCollection.profilePageCofig;
      }
    }

    return AppPageCollection.loginPageCofig;
  }

  @override
  RouteInformation restoreRouteInformation(configuration) {
    return RouteInformation(location: configuration.path);
  }
}
