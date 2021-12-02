import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_srapp/constants/styles/font_sizes.dart';
import 'package:demo_srapp/constants/styles/paddings.dart';

import 'package:demo_srapp/view_models/app_theme_viewmodel.dart';
import 'package:demo_srapp/view_models/auth_viewmodel.dart';
import 'package:demo_srapp/widgets/index.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: appTheme.profileBackgroud,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        padding: const EdgeInsets.symmetric(horizontal: CPaddings.xl),
        child: SafeArea(
          top: true,
          bottom: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              const ProfileHeader(),
              const SizedBox(height: CPaddings.l),
              //ProfileCard(),
              const SizedBox(height: CPaddings.xl),
              //ProfileWallet(),
              const SizedBox(height: CPaddings.l),
              //LoginButton(),
              ElevatedButton(
                  style: appTheme.themedButtonStyle,
                  onPressed: () {},
                  child: Text('Hi')),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = Provider.of<AuthViewModel>(context);

    return ElevatedButton(
      style: CustomStyle.buttonStyle(context),
      onPressed: () {
        appLogin.logout();
      },
      child: const Text('Logout'),
    );
  }
}
*/
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = context.watch<AuthViewModel>();
    final appTheme = context.watch<AppThemeViewModel>();

    const _textTitleStyle = TextStyle(fontSize: CFontSizes.xl);
    const _textBodyStyle = TextStyle(fontSize: CFontSizes.l);
    final _textBodyASG = AutoSizeGroup();

    return Column(children: [
      Row(
        children: [
          CustomText(
            appLogin.patron?.name ?? 'NOT LOGGED IN',
            style: _textTitleStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
      const SizedBox(height: 5),
      if (appLogin.patron != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              'No. ${appLogin.patron!.pid}',
              style: _textBodyStyle.copyWith(color: Colors.grey),
              group: _textBodyASG,
            ),
            CustomText(
              'Valid until | ${appLogin.patron!.tierExpDate}',
              style: _textBodyStyle.copyWith(color: Colors.grey),
              group: _textBodyASG,
            ),
          ],
        )
    ]);
  }
}
/*
class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(CRadius.m),
      child: Image.asset(appTheme.currentTheme.profileCardBackground),
    );
  }
}

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