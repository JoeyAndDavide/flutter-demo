import 'package:demo_srapp/views/router/app_pages.dart';

enum AppPageActions {
  none,
  addPages,
  pop,
  replace,
  replaceAll,
}

class AppPageAction {
  AppPageActions action;
  List<AppPageConfiguration>? pages;

  AppPageAction({
    this.action = AppPageActions.none,
    this.pages,
  });
}
