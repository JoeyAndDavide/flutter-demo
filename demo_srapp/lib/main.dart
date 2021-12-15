import 'package:demo_srapp/auth_states.dart';
import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/data/auth_repository.dart';
import 'package:demo_srapp/router/app_pages.dart';
import 'package:demo_srapp/router/app_router_delegate.dart';
import 'package:demo_srapp/router/app_router_information_parser.dart';
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
  final AuthRepository _authRepository = AuthRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPageStacks>(
          create: (context) => AppPageStacks(),
        ),
        ChangeNotifierProvider<AuthStates>(
            create: (context) => AuthStates(_authRepository)),
        ChangeNotifierProxyProvider<AuthStates, AppTheme>(
            create: (context) => AppTheme(null),
            update: (context, value, previous) =>
                previous!..appThemeType = null),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          title: 'SR App - Prototype',
          theme: Provider.of<AppTheme>(context).themeData,
          routerDelegate: AppRouterDelegate(
            Provider.of<AppPageStacks>(context),
            Provider.of<AuthStates>(context),
          ),
          routeInformationParser: AppRouterInformationParser(),
        );
      },
    );
  }
}
