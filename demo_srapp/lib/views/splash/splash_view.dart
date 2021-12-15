import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: context.watch<AppTheme>().appBackground,
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: Resources.of(context).dimensions.paddingXL),
        child: Center(
          child: Image.asset(
            'assets/scl_logo.png',
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ),
    );
  }
}
