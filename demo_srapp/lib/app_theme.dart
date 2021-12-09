import 'package:demo_srapp/app_state.dart';
import 'package:demo_srapp/constants/asset_paths.dart';
import 'package:flutter/material.dart';

enum AppThemeType { gold1, apex }

class AppTheme extends ChangeNotifier {
  final AppState appState = AppState();

  AppTheme() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  // Contants
  static const Color _colorGold1 = Color(0xFFBDA266);
  static const Color _colorGrey1 = Color(0xFFECECEC);
  static const Color _colorWhite = Colors.white;
  static const Color _colorBlack = Colors.black;

  //Font sizes
  static const double _fontSizeXS = 2.0;
  static const double _fontSizeS = 5.0;
  static const double _fontSizeM = 8.0;
  static const double _fontSizeL = 15.0;
  static const double _fontSizeXL = 20.0;

  // ThemeData
  ThemeData get themeData {
    switch (appState.appThemeType) {
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
        );
    }
  }

  // Colors
  Color get buttonActiveColor => _colorGold1;
  Color get buttonInactiveColor => _colorGrey1;
  Color get loadingIconColor => _colorGold1;

  // Assets
  AssetImage get appBackground {
    return const AssetImage(AssetPaths.appBackground);
  }

  AssetImage get profileBackgroud {
    switch (appState.appThemeType) {
      case AppThemeType.gold1:
        return const AssetImage(AssetPaths.profileBackgroundGold);
      case AppThemeType.apex:
        return const AssetImage(AssetPaths.profileBackgroundApex);
    }
  }

  AssetImage get profileCardBackgroud {
    switch (appState.appThemeType) {
      case AppThemeType.gold1:
        return const AssetImage(AssetPaths.profileCardBackgroundGold);
      case AppThemeType.apex:
        return const AssetImage(AssetPaths.profileCardBackgroundApex);
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

  TextStyle get profileHeaderTitleTextStyle =>
      const TextStyle(fontSize: _fontSizeXL, color: _colorWhite);

  TextStyle get profileHeaderBodyTextStyle =>
      const TextStyle(fontSize: _fontSizeL, color: _colorGrey1);
}
