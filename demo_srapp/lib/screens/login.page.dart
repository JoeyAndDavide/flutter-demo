import 'package:demo_srapp/models/patron.model.dart';
import 'package:demo_srapp/services/authenticate.service.dart';
import 'package:demo_srapp/shared/app_login.store.dart';
import 'package:demo_srapp/shared/common.style.dart';
import 'package:demo_srapp/shared/constants.style.dart';
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
              const SizedBox(height: CustomSize.xxxl),
              ElevatedButton(
                style: CustomStyle.buttonStyle(context),
                onPressed: () async {
                  Patron patron = await AuthenticateService().login('4988800');
                  appLogin.login(patron);
                },
                child: const Text('PID: 4988800'),
              ),
              const SizedBox(height: CustomSize.s),
              ElevatedButton(
                style: CustomStyle.buttonStyle(context),
                onPressed: () async {
                  Patron patron = await AuthenticateService().login('4988801');
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
