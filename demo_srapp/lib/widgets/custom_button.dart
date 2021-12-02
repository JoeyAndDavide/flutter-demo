/*import 'package:demo_srapp/constants/index.dart';
import 'package:demo_srapp/view_models/app_theme_viewmodel.dart';
import 'package:demo_srapp/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton(
    this.text, {
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme =
        context.select((AppThemeViewModel t) => t.currentTheme);

    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return currentTheme.buttonColorInactive;
          }
          return currentTheme.buttonColorActive;
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CRadius.xxxl),
        ),
      ),
    );

    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: CustomText(text),
    );
  }
}
*/