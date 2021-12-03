import 'package:demo_srapp/models/patron.dart';

class AuthRepository {
  Future<Patron> login(String pid) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
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

        return Patron(
            pid: '0',
            name: 'Chan Tai Man',
            tier: PatronTier.gold1,
            tierExpDate: '2021-12-01');
      },
    );
  }

  Future<void> logout() async {}
}
