import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final int maxLines;
  final TextStyle? style;
  final AutoSizeGroup? group;

  const CustomText(
    this.text, {
    this.minFontSize = 1,
    this.maxLines = 1,
    this.style,
    this.group,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: minFontSize,
      maxLines: maxLines,
      style: style,
      group: group,
    );
  }
}
