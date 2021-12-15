import 'package:auto_size_text/auto_size_text.dart';
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

                // Profile Card Section
                ClipRRect(
                  borderRadius: Resources.of(context).dimensions.borderRadius,
                  child: Image(
                      image: appTheme.profileCardBackgroud, fit: BoxFit.cover),
                ),
                SizedBox(height: Resources.of(context).dimensions.paddingL),

                // Profile Wallet Section
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                Resources.of(context).dimensions.borderRadius),
                        child: Padding(
                          padding: EdgeInsets.all(
                              Resources.of(context).dimensions.paddingL),
                          child: const AutoSizeText('Points'),
                        ),
                      ),
                    ),
                    SizedBox(width: Resources.of(context).dimensions.paddingS),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          print('hello');
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: Resources.of(context)
                                  .dimensions
                                  .borderRadius),
                          child: Padding(
                            padding: EdgeInsets.all(
                                Resources.of(context).dimensions.paddingL),
                            child: const AutoSizeText('Wallet'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Resources.of(context).dimensions.paddingS),

                // Profile Offers Section
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          Resources.of(context).dimensions.borderRadius),
                  child: Padding(
                    padding: EdgeInsets.all(
                        Resources.of(context).dimensions.paddingL),
                    child: Row(children: const [
                      Expanded(child: AutoSizeText('Free Offers')),
                      Expanded(child: AutoSizeText('Earn & Get Offers')),
                    ]),
                  ),
                ),
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
