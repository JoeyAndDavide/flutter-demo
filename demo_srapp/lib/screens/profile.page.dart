import 'package:demo_srapp/models/patron.model.dart';
import 'package:demo_srapp/screens/widgets/profile_card.widget.dart';
import 'package:demo_srapp/screens/widgets/profile_header.widget.dart';
import 'package:demo_srapp/screens/widgets/profile_wallet.widget.dart';
import 'package:demo_srapp/shared/app_login.store.dart';
import 'package:demo_srapp/shared/app_theme.store.dart';
import 'package:demo_srapp/shared/common.style.dart';
import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final appTheme = Provider.of<AppTheme>(context).currentTheme;

    // Build
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(appTheme.profileBackgroud),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        padding: const EdgeInsets.symmetric(horizontal: CustomSize.xl),
        child: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              const ProfileHeader(),
              const SizedBox(height: CustomSize.l),
              const ProfileCard(),
              const SizedBox(height: CustomSize.xl),
              const ProfileWallet(),
              const SizedBox(height: CustomSize.l),
              const LoginButton(),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppTheme>(context, listen: false)
                      .changeThemeType(AppThemeType.base);
                },
                child: const Text('Base Theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AppTheme>(context, listen: false)
                      .changeThemeType(AppThemeType.apex);
                },
                child: const Text('Apex Theme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = Provider.of<AppLogin>(context);

    return ElevatedButton(
      style: CustomStyle.buttonStyle(context),
      onPressed: () {
        if (appLogin.patron == null) {
          appLogin.login(Patron(
              pid: '4988800',
              name: 'FEI FEI HO',
              tier: PatronTier.gold1,
              tierExpDate: '2021-12-01'));
        } else {
          appLogin.logout();
        }
      },
      child: Text(appLogin.patron == null ? 'Login' : 'Logout'),
    );
  }
}
