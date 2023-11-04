import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyle {
  static TextStyle _base({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w400,
    Color color = AppColors.textColor,
    double letterSpacing = 0.0,
    double? height,
    TextDecoration? decoration,
  }) =>
      GoogleFonts.poppins(
        color: color,
        decoration: decoration,
        fontSize: fontSize * 1.sp,
        fontWeight: fontWeight,
        height: height != null ? height * 1.sp : null,
        letterSpacing: letterSpacing * 1.sp,
        locale: const Locale('en', 'EN'),
        textBaseline: TextBaseline.alphabetic,
      );

  static TextTheme mainTextTheme = TextTheme(
    bodyLarge: bodyLarge(),
    bodyMedium: bodyMedium(),
    bodySmall: bodySmall(),
    displayLarge: displayLarge(),
    displayMedium: displayMedium(),
    displaySmall: displaySmall(),
    headlineLarge: headlineLarge(),
    headlineMedium: headlineMedium(),
    headlineSmall: headlineSmall(),
    labelSmall: bodySmall(fontWeight: FontWeight.w500),
    labelMedium: bodyMedium(fontWeight: FontWeight.w500),
    labelLarge: bodyLarge(fontWeight: FontWeight.w500),
    titleLarge: headlineLarge(),
    titleMedium: headlineMedium(),
    titleSmall: headlineSmall(),
  );

  static TextStyle displayLarge({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 24 / 32,
        letterSpacing: 0.01 * 32,
      );

  static TextStyle displayMedium({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 24 / 24,
        letterSpacing: 0.01 * 24,
      );

  static TextStyle displaySmall({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 21.6 / 18,
        letterSpacing: 0.01 * 18,
      );

  static TextStyle headlineLarge({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle headlineMedium({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle headlineSmall({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bodyLarge(
          {Color color = AppColors.textColor, FontWeight? fontWeight}) =>
      _base(
          color: color,
          fontSize: 16,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 16 / 16,
          letterSpacing: 0.01 * 16);

  static TextStyle bodyMedium(
          {Color color = AppColors.textColor, FontWeight? fontWeight}) =>
      _base(
          color: color,
          fontSize: 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 14 / 14,
          letterSpacing: 0.01 * 14);

  static TextStyle bodySmall(
          {Color color = AppColors.textColor, FontWeight? fontWeight}) =>
      _base(
          color: color,
          fontSize: 12,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 12 / 12,
          letterSpacing: 0.01 * 12);

  static TextStyle bodyMediumHigh(
          {Color color = AppColors.textColor, FontWeight? fontWeight}) =>
      _base(
          color: color,
          fontSize: 14,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: 24 / 14,
          letterSpacing: 0.01 * 14);

  static TextStyle labelNavbar({Color color = AppColors.textColor}) => _base(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 0,
        letterSpacing: 0.01 * 14,
      );
}
