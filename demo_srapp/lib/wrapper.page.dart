import 'package:demo_srapp/screens/login.page.dart';
import 'package:demo_srapp/screens/profile.page.dart';
import 'package:demo_srapp/shared/app_login.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLogin = Provider.of<AppLogin>(context);

    return appLogin.patron == null ? const LoginPage() : const ProfilePage();
  }
}
