import 'package:demo_srapp/utils/utils.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:demo_srapp/view_models/app_theme_viewmodel.dart';
import 'package:demo_srapp/views/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SR App - Prototype',
      theme: context.watch<AppThemeViewModel>().themeData,
      home: const ProfilePage(),
    );
  }
}
