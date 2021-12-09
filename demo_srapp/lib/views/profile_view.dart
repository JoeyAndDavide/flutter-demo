import 'package:demo_srapp/resources/resources.dart';
import 'package:demo_srapp/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App State
    final appTheme = context.watch<AppTheme>();

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
                //const _ProfileHeader(),
                SizedBox(height: Resources.of(context).dimensions.paddingL),
                const _ProfileCard(),
                SizedBox(height: Resources.of(context).dimensions.paddingL),
                const _ProfileWallet(),
                SizedBox(height: Resources.of(context).dimensions.paddingS),
                const _ProfileOffers(),
                SizedBox(height: Resources.of(context).dimensions.paddingXL),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final appTheme = context.watch<AppTheme>();
    final bodyTextASG = AutoSizeGroup();

    return Column(children: [
      Row(
        children: [
          AutoSizeText(
            appState.loggedInPatronName,
            style: appTheme.profileHeaderTitleTextStyle,
            maxLines: 1,
          ),
        ],
      ),
      const SizedBox(height: 5),
      if (appState.loggedIn)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'No. ${appState.loggedInPatronID}',
              style: appTheme.profileHeaderBodyTextStyle,
              group: bodyTextASG,
              maxLines: 1,
            ),
            AutoSizeText(
              'Valid until |',
              style: appTheme.profileHeaderBodyTextStyle,
              group: bodyTextASG,
              maxLines: 1,
            ),
          ],
        )
    ]);
  }
}
*/

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return ClipRRect(
      borderRadius: Resources.of(context).dimensions.borderRadius,
      child: Image(image: appTheme.profileCardBackgroud, fit: BoxFit.cover),
    );
  }
}

class _ProfileWallet extends StatelessWidget {
  const _ProfileWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: Resources.of(context).dimensions.borderRadius),
            child: Padding(
              padding:
                  EdgeInsets.all(Resources.of(context).dimensions.paddingL),
              child: const Text('Hello'),
            ),
          ),
        ),
        SizedBox(width: Resources.of(context).dimensions.paddingS),
        Expanded(
          flex: 1,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: Resources.of(context).dimensions.borderRadius),
            child: Padding(
              padding:
                  EdgeInsets.all(Resources.of(context).dimensions.paddingL),
              child: const Text('Hello'),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProfileOffers extends StatelessWidget {
  const _ProfileOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: Resources.of(context).dimensions.borderRadius),
      child: Padding(
        padding: EdgeInsets.all(Resources.of(context).dimensions.paddingL),
        child: Row(children: [
          Expanded(child: const Text('Hello')),
          Expanded(child: const Text('Hello')),
        ]),
      ),
    );
  }
}
