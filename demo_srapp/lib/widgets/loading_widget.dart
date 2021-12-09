import 'package:demo_srapp/app_theme.dart';
import 'package:demo_srapp/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: appTheme.appBackground,
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: Resources.of(context).dimensions.paddingXL),
      child: Center(
        child: SpinKitChasingDots(
          color: appTheme.loadingIconColor,
          size: 50.0,
        ),
      ),
    );
  }
}
