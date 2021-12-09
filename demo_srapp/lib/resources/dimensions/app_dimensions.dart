import 'package:demo_srapp/resources/dimensions/i_dimensions.dart';
import 'package:flutter/material.dart';

class AppDimensions implements IDimensions {
  //Padding
  @override
  double get paddingXS => 2.0;
  @override
  double get paddingS => 5.0;
  @override
  double get paddingM => 8.0;
  @override
  double get paddingL => 12.0;
  @override
  double get paddingXL => 20.0;
  @override
  double get paddingXXL => 40.0;

  //Elevation
  @override
  double get elevationLight => 4.0;
  @override
  double get elevationMedium => 8.0;
  @override
  double get elevationHigh => 16.0;

  //Radius
  @override
  BorderRadius get borderRadius => BorderRadius.circular(10);
}
