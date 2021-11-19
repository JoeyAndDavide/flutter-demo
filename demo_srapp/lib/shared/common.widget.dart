import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SingleLineText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final AutoSizeGroup? group;

  const SingleLineText(this.text, {this.style, this.group, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 1,
      maxLines: 1,
      style: style,
      group: group,
    );
  }
}
