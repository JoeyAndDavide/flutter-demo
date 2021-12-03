import 'package:demo_srapp/resources/resources.dart';
import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
