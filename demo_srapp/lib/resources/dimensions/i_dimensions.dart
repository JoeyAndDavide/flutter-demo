import 'package:flutter/material.dart';

abstract class IDimensions {
  //Padding
  double get paddingXS;
  double get paddingS;
  double get paddingM;
  double get paddingL;
  double get paddingXL;
  double get paddingXXL;

  //Elevation
  double get elevationLight;
  double get elevationMedium;
  double get elevationHigh;

  //Radius
  BorderRadius get borderRadius;
}
