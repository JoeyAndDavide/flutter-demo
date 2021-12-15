import 'package:demo_srapp/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends Page {
  const ProfilePage() : super(key: const ValueKey('Profile'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return const ProfileView();
        });
  }
}
