import 'package:demo_srapp/utils/utils.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:demo_srapp/view_models/app_theme_viewmodel.dart';
import 'package:demo_srapp/views/router/app_router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppRouterDelegate delegate;

  @override
  void initState() {
    super.initState();
    delegate = AppRouterDelegate();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProxyProvider<AuthViewModel, AppThemeViewModel>(
          create: (BuildContext context) => AppThemeViewModel(
              appThemeType: Utils.mapPatronTierTheme(
                  Provider.of<AuthViewModel>(context, listen: false)
                      .patron
                      ?.tier)),
          update: (BuildContext context, AuthViewModel auth,
                  AppThemeViewModel? appTheme) =>
              AppThemeViewModel(
                  appThemeType: Utils.mapPatronTierTheme(auth.patron?.tier)),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'SR App - Prototype',
          theme: Provider.of<AppThemeViewModel>(context).themeData,
          home: Router(
            routerDelegate: delegate,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        );
      },
    );
  }
}
