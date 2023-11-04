import 'package:flutter/material.dart';

class AppColors {
  // Global
  static const Color primaryColor = Color(0xFFFD683D);
  static const Color secondaryColor = Color(0xFF1D272F);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFF9F9F9);
  static const Color activeIconColor = secondaryColor;
  static const Color inactiveIconColor = Color(0xFFA7A9B7);
  static const Color textfieldBackgroundColor = Color(0xFFFFFFFF);
  static const Color hintTextColor = Color(0xFFA7A9B7);
  static const Color textColor = Color(0xFF191D31);
  static const Color lighterTextColor = Color(0xFFA7A9B7);
  static const Color secondaryTextColor = Color(0xFFFFFFFF);

  static const Color red = Color(0xFFF51818);
  static const Color green = Color(0xFF38DE35);

  //Gradient
  static LinearGradient gradient1 = LinearGradient(
      colors: [backgroundColor, backgroundColor.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
}
