import 'package:demo_srapp/resources/dimensions/app_dimensions.dart';
import 'package:flutter/material.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  AppDimensions get dimensions => AppDimensions();

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
