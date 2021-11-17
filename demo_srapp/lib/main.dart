import 'package:demo_srapp/screens/profile/profile.page.dart';
import 'package:demo_srapp/themes/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomTheme>(create: (_) => CustomTheme()),
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
      theme: Provider.of<CustomTheme>(context).theme.theme,
      home: const ProfilePage(),
    );
  }
}
