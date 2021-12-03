import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:demo_srapp/view_models/app_theme_viewmodel.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final appTheme = context.watch<AppThemeViewModel>();

    // Build
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: appTheme.profileBackgroud,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: Resources.of(context).dimensions.paddingXL),
          child: SafeArea(
            top: true,
            bottom: true,
            child: ListView(
              shrinkWrap: true,
              children: [
                const ProfileHeader(),
                SizedBox(height: Resources.of(context).dimensions.paddingL),
                const ProfileCard(),
                SizedBox(height: Resources.of(context).dimensions.paddingL),
                //ProfileWallet(),
                SizedBox(height: Resources.of(context).dimensions.paddingXL),
                const LoginButton('4988800'),
                const LoginButton('4988801'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String pid;

  const LoginButton(this.pid, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = context.read<AuthViewModel>();
    final appTheme = context.watch<AppThemeViewModel>();

    return ElevatedButton(
      style: appTheme.themedButtonStyle,
      onPressed: () async {
        if (appLogin.patron == null) {
          await appLogin.login(pid);
        } else {
          await appLogin.logout();
        }
      },
      child: Text(pid),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = context.watch<AuthViewModel>();
    final appTheme = context.watch<AppThemeViewModel>();
    final bodyTextASG = AutoSizeGroup();

    return Column(children: [
      Row(
        children: [
          AutoSizeText(
            appLogin.patron?.name ?? 'NOT LOGGED IN',
            style: appTheme.profileHeaderTitleTextStyle,
            maxLines: 1,
          ),
        ],
      ),
      const SizedBox(height: 5),
      if (appLogin.patron != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'No. ${appLogin.patron!.pid}',
              style: appTheme.profileHeaderBodyTextStyle,
              group: bodyTextASG,
              maxLines: 1,
            ),
            AutoSizeText(
              'Valid until | ${appLogin.patron!.tierExpDate}',
              style: appTheme.profileHeaderBodyTextStyle,
              group: bodyTextASG,
              maxLines: 1,
            ),
          ],
        )
    ]);
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppThemeViewModel>();

    return ClipRRect(
      borderRadius: Resources.of(context).dimensions.borderRadius,
      child: Image(image: appTheme.profileCardBackgroud),
    );
  }
}

/*
class ProfileWallet extends StatelessWidget {
  const ProfileWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CRadius.m),
    );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            shape: cardShape,
            margin: const EdgeInsets.only(right: CPaddings.s),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CPaddings.xl, vertical: CPaddings.l),
              child: Text('Hello'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            shape: cardShape,
            margin: const EdgeInsets.only(left: CPaddings.s),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CPaddings.xl, vertical: CPaddings.l),
              child: Text('Hello'),
            ),
          ),
        ),
      ],
    );
  }
}
*/