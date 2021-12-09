import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final appTheme = context.watch<AppTheme>();
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: appTheme.appBackground,
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
