import 'package:demo_srapp/constants/api_codes.dart';
import 'package:demo_srapp/data/responses/repo_response.dart';
import 'package:demo_srapp/models/patron.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  static const authToken = 'AUTH_TOKEN';

  final storage = const FlutterSecureStorage();

  Future<String> get storedAuthToken async {
    final token = await storage.read(key: authToken);
    if (token == null) return "";
    return token;
  }

  //-------------------------------------------------------

  Future<RepoResponse> login(String pid) async {
    RepoResponse resp;
    Patron? patron = _getDummyPatron(pid);

    if (patron != null) {
      await storage.write(key: authToken, value: patron.pid);
      resp = RepoResponse<Patron>(code: ApiCode.success, data: patron);
    } else {
      await storage.delete(key: authToken);
      resp = RepoResponse(code: ApiCode.invalidResponse);
    }

    return Future.delayed(
      const Duration(seconds: 1),
      () => resp,
    );
  }

  Future<RepoResponse> getPatron() async {
    final pid = await storage.read(key: authToken);
    if (pid != null) {
      Patron? patron = _getDummyPatron(pid);
      if (patron != null) {
        return RepoResponse<Patron>(code: ApiCode.success, data: patron);
      }
    }
    return RepoResponse(code: ApiCode.invalidResponse);
  }

  Future<void> logout() async {
    await storage.delete(key: authToken);
  }

  Patron? _getDummyPatron(String pid) {
    if (pid == '4988800') {
      return Patron(
          pid: '4988800',
          name: 'FEI FEI HO',
          tier: PatronTier.gold1,
          tierExpDate: '2021-12-01');
    } else if (pid == '4988801') {
      return Patron(
          pid: '4988801',
          name: 'Mei Mei HO',
          tier: PatronTier.apex,
          tierExpDate: '2021-12-01');
    }
  }
}
