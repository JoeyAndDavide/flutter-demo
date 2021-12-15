import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AutoSizeText('Settings')),
      body: const Center(
        child: AutoSizeText('Settings'),
      ),
    );
  }
}
