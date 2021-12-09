import 'package:demo_srapp/models/patron.dart';
import 'package:demo_srapp/app_theme.dart';

class Utils {
  // Convert Patron Tier to App Theme Type
  static AppThemeType mapPatronTierTheme(PatronTier? patronTier) {
    switch (patronTier ?? PatronTier.gold1) {
      case PatronTier.gold1:
        return AppThemeType.gold1;
      case PatronTier.apex:
        return AppThemeType.apex;
    }
  }
}
