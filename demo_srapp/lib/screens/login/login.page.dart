import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text('Login')),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
                  ),
                ),
              ]))),
    );
  }
}
