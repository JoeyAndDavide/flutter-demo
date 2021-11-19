import 'package:demo_srapp/shared/app_theme.store.dart';
import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(CustomRadius.m),
      child: Image.asset(appTheme.currentTheme.profileCardBackground),
    );
  }
}
