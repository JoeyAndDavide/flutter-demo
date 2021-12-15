import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final appTheme = context.watch<AppTheme>();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/scl_logo.png',
                width: MediaQuery.of(context).size.width * 0.4,
              ),
            ),
            SizedBox(height: Resources.of(context).dimensions.paddingXL),
            AutoSizeText(
              '404 Page Not Found',
              style: context.watch<AppTheme>().unknownPageBodyTextStyle,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
