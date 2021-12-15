import 'package:demo_srapp/views/unknown/unknown_view.dart';
import 'package:flutter/material.dart';

class UnknownPage extends Page {
  const UnknownPage() : super(key: const ValueKey('Unknown'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return const UnknownView();
      },
    );
  }
}
