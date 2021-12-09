import 'package:demo_srapp/views/router/app_router_delegate.dart';
import 'package:flutter/material.dart';

class AppBackButtonDispactcher extends RootBackButtonDispatcher {
  final AppRouterDelegate appRouterDelegate;

  AppBackButtonDispactcher(this.appRouterDelegate);

  @override
  Future<bool> didPopRoute() {
    return appRouterDelegate.popRoute();
  }
}
