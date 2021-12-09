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
      if (path == AppPageCollection.splashPageConfig.path) {
        return AppPageCollection.splashPageConfig;
      }
      if (path == AppPageCollection.loginPageConfig.path) {
        return AppPageCollection.loginPageConfig;
      }
      if (path == AppPageCollection.profilePageConfig.path) {
        return AppPageCollection.profilePageConfig;
      }
    }

    return AppPageCollection.splashPageConfig;
  }

  @override
  RouteInformation restoreRouteInformation(configuration) {
    return RouteInformation(location: configuration.path);
  }
}
