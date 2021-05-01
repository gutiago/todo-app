import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._() : super();

  static const lightBlue = Color.fromRGBO(121, 167, 238, 1.0);
  static const darkBlue = Color.fromRGBO(76, 133, 223, 1.0);
  static const errorRed = Color.fromRGBO(176, 0, 32, 1.0);
  static const enabledColor = Color.fromRGBO(0, 178, 0, 1.0);
  static const disabledColor = Color.fromRGBO(189, 189, 189, 1.0);

  static const gradientSet = [lightBlue, darkBlue];
}
