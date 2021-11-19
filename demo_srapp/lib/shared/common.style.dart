import 'package:demo_srapp/shared/app_theme.store.dart';
import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomStyle {
  static ButtonStyle buttonStyle(context) {
    final appTheme = Provider.of<AppTheme>(context);

    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return appTheme.currentTheme.buttonColorInactive;
          }
          return appTheme.currentTheme.buttonColorActive;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomRadius.xxxl),
        ),
      ),
    );
  }
}
