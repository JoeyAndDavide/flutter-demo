/*
import 'package:demo_srapp/models/patron.dart';
import 'package:demo_srapp/styles/common.style.dart';
import 'package:demo_srapp/styles/index.dart';
import 'package:demo_srapp/services/auth_service.dart';
import 'package:demo_srapp/components/app_login.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final appLogin = Provider.of<AppLogin>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login/login_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/scl_logo.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: CPaddings.xxxl),
              ElevatedButton(
                style: CustomStyle.buttonStyle(context),
                onPressed: () async {
                  Patron patron = await AuthService().login('4988800');
                  appLogin.login(patron);
                },
                child: const Text('PID: 4988800'),
              ),
              const SizedBox(height: CPaddings.s),
              ElevatedButton(
                style: CustomStyle.buttonStyle(context),
                onPressed: () async {
                  Patron patron = await AuthService().login('4988801');
                  appLogin.login(patron);
                },
                child: const Text('PID: 4988801'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/