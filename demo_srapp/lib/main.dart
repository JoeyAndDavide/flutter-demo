import 'package:demo_srapp/shared/app_login.store.dart';
import 'package:demo_srapp/shared/app_theme.store.dart';
import 'package:demo_srapp/wrapper.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLogin>(create: (_) => AppLogin()),
        ChangeNotifierProvider<AppTheme>(create: (_) => AppTheme()),
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
      theme: Provider.of<AppTheme>(context).currentTheme.theme,
      home: const Wrapper(),
    );
  }
}
