import 'package:demo_srapp/views/settings/settings_view.dart';
import 'package:flutter/material.dart';

class SettingsPage extends Page {
  const SettingsPage() : super(key: const ValueKey('Profile'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return const SettingsView();
        });
  }
}
