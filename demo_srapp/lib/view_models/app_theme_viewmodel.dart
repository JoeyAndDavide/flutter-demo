import 'package:demo_srapp/constants/assets_path.dart';
import 'package:flutter/material.dart';

enum AppThemeType { gold1, apex }

class AppThemeViewModel extends ChangeNotifier {
  AppThemeType? appThemeType;

  AppThemeViewModel({this.appThemeType});

  // Contants
  static const Color _colorGold1 = Color(0xFFBDA266);
  static const Color _colorGold2 = Color(0xFFCBAE7D);
  static const Color _colorGold3 = Color(0xFFFFD078);
  static const Color _colorGrey1 = Color(0xFFECECEC);
  static const Color _colorGrey2 = Color(0xFF9E9E9E);
  static const Color _colorWhite = Colors.white;
  static const Color _colorBlack = Colors.black;

  // ThemeData
  ThemeData get themeData {
    switch (appThemeType ?? AppThemeType.gold1) {
      case AppThemeType.gold1:
        return ThemeData.light().copyWith(
          scaffoldBackgroundColor: _colorGrey1,
          backgroundColor: _colorGrey1,
          primaryColor: _colorWhite,
        );
      case AppThemeType.apex:
        return ThemeData.dark().copyWith(
          scaffoldBackgroundColor: _colorBlack,
          backgroundColor: _colorBlack,
          primaryColor: _colorWhite,
        );
    }
  }

  // Colors
  Color get buttonActiveColor => _colorGold1;
  Color get buttonInactiveColor => _colorGrey1;

  // Assets
  AssetImage get profileBackgroud {
    switch (appThemeType ?? AppThemeType.gold1) {
      case AppThemeType.gold1:
        return const AssetImage(AssetsPath.profileBackgroundGold);
      case AppThemeType.apex:
        return const AssetImage(AssetsPath.profileBackgroundApex);
    }
  }

  AssetImage get profileCardBackgroud {
    switch (appThemeType ?? AppThemeType.gold1) {
      case AppThemeType.gold1:
        return const AssetImage(AssetsPath.profileCardBackgroundGold);
      case AppThemeType.apex:
        return const AssetImage(AssetsPath.profileCardBackgroundApex);
    }
  }

  // Styles
  ButtonStyle get themedButtonStyle {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return buttonInactiveColor;
          }
          return buttonActiveColor;
        },
      ),
      shape: MaterialStateProperty.all(const StadiumBorder()),
    );
  }
}
