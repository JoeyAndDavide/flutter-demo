import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';

class BaseTheme {
  // Colors
  Color get backgroundColor => CustomColors.lightgrey;
  Color get primaryColor => Colors.white;
  Color get textColor1 => Colors.white;
  Color get textColor2 => Colors.grey;
  Color get textColor3 => Colors.black;
  Color get textColor4 => CustomColors.gold1;
  Color get cardColor1 => Colors.white;
  Color get buttonColorActive => CustomColors.gold2;
  Color get buttonColorInactive => CustomColors.gold2;

  // Asset Paths
  String get profileBackgroud => 'assets/profile/bg_gold.png';
  String get profileCardBackground => 'assets/profile/card_gold.png';

  // Themedata
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        backgroundColor: backgroundColor,
        primaryColor: primaryColor,
      );
}
