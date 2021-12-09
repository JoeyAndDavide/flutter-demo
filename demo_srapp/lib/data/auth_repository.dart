import 'package:demo_srapp/constants/api_codes.dart';
import 'package:demo_srapp/constants/shared_preference_keys.dart';
import 'package:demo_srapp/data/responses/repo_response.dart';
import 'package:demo_srapp/models/patron.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<RepoResponse> login(String pid) async {
    final prefs = await SharedPreferences.getInstance();

    Patron? patron;
    if (pid == '4988800') {
      patron = Patron(
          pid: '4988800',
          name: 'FEI FEI HO',
          tier: PatronTier.gold1,
          tierExpDate: '2021-12-01');
    } else if (pid == '4988801') {
      patron = Patron(
          pid: '4988801',
          name: 'Mei Mei HO',
          tier: PatronTier.apex,
          tierExpDate: '2021-12-01');
    }

    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (patron != null) {
          prefs.setBool(SharedPrefernceKeys.authKey, true);
          return RepoResponse<Patron>(code: ApiCode.success, data: patron);
        } else {
          prefs.setBool(SharedPrefernceKeys.authKey, false);
          return RepoResponse(code: ApiCode.invalidResponse);
        }
      },
    );
  }

  Future<void> logout() async {}
}
