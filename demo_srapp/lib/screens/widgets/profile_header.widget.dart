import 'package:auto_size_text/auto_size_text.dart';
import 'package:demo_srapp/shared/app_login.store.dart';
import 'package:demo_srapp/shared/app_theme.store.dart';
import 'package:demo_srapp/shared/common.widget.dart';
import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = Provider.of<AppLogin>(context);
    final appTheme = Provider.of<AppTheme>(context).currentTheme;

    const _textTitleStyle = TextStyle(fontSize: CustomFontSize.xl);
    const _textBodyStyle = TextStyle(fontSize: CustomFontSize.l);
    final _textBodyASG = AutoSizeGroup();

    return Column(children: [
      Row(
        children: [
          SingleLineText(
            appLogin.patron?.name ?? 'NOT LOGGED IN',
            style: _textTitleStyle.copyWith(color: appTheme.textColor1),
          ),
        ],
      ),
      const SizedBox(height: 5),
      if (appLogin.patron != null)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleLineText(
              'No. ${appLogin.patron!.pid}',
              style: _textBodyStyle.copyWith(color: appTheme.textColor1),
              group: _textBodyASG,
            ),
            SingleLineText(
              'Valid until | ${appLogin.patron!.tierExpDate}',
              style: _textBodyStyle.copyWith(color: appTheme.textColor1),
              group: _textBodyASG,
            ),
          ],
        )
    ]);
  }
}
