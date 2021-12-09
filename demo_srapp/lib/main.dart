import 'package:demo_srapp/data/auth_repository.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/views/router/app_backbutton_dispatcher.dart';
import 'package:demo_srapp/views/router/app_pages.dart';
import 'package:demo_srapp/views/router/app_router_delegate.dart';
import 'package:demo_srapp/views/router/app_router_information_parser.dart';
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
  AuthRepository authRepository = AuthRepository();
  late AppRouterDelegate delegate;
  late AppRouterInformationParser appRouterInformationParser;
  late AppBackButtonDispactcher appBackButtonDispactcher;

  @override
  void initState() {
    super.initState();
    authRepository;
    delegate = AppRouterDelegate();
    appRouterInformationParser = AppRouterInformationParser();
    appBackButtonDispactcher = AppBackButtonDispactcher(delegate);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>(create: (_) => AppTheme()),
        ChangeNotifierProvider<AuthViewModel>(
            create: (_) => AuthViewModel(authRepository)),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'SR App - Prototype',
          theme: Provider.of<AppTheme>(context).themeData,
          home: Router(
            routerDelegate: delegate,
            routeInformationParser: appRouterInformationParser,
            backButtonDispatcher: appBackButtonDispactcher,
          ),
        );
      },
    );
  }
}
