import 'package:demo_srapp/shared/constants.style.dart';
import 'package:flutter/material.dart';

class ProfileWallet extends StatelessWidget {
  const ProfileWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomRadius.m),
    );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            shape: cardShape,
            margin: const EdgeInsets.only(right: CustomSize.s),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomSize.xl, vertical: CustomSize.l),
              child: Text('Hello'),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            shape: cardShape,
            margin: const EdgeInsets.only(left: CustomSize.s),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CustomSize.xl, vertical: CustomSize.l),
              child: Text('Hello'),
            ),
          ),
        ),
      ],
    );
  }
}
