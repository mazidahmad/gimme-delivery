import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppTheme {
  static ThemeData main() => ThemeData(
        //------------- App Colors -------------//
        primaryColor: AppColors.primaryColor,
        dividerColor: Colors.transparent,
        hoverColor: Colors.white,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: AppColors.secondaryColor.withOpacity(0.2),
        highlightColor: Colors.transparent,

        //------------- App Bar -------------//
        appBarTheme: AppBarTheme(
          foregroundColor: AppColors.textColor,
          backgroundColor: AppColors.backgroundColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          elevation: 0,
          shadowColor: Colors.transparent,
          titleTextStyle: AppTextStyle.headlineLarge(),
          iconTheme: IconThemeData(
            color: AppColors.textColor,
            opacity: 1,
            size: 28.sp,
          ),
        ),

        //------------- Font -------------//
        textTheme: AppTextStyle.mainTextTheme,

        //------------- Text Selection -------------//
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primaryColor.withOpacity(.6),
          selectionColor: AppColors.primaryColor.withOpacity(.5),
          selectionHandleColor: AppColors.primaryColor.withOpacity(1),
        ),

        //------------- Elevated Button -------------//
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100.w, 40.h),
            backgroundColor: AppColors.primaryColor,
            textStyle: AppTextStyle.headlineMedium(color: Colors.white),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.h),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        //--------- Bottom Navigation Bar ----------//
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0,
          selectedLabelStyle: AppTextStyle.headlineSmall(),
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: AppColors.textColor,
          selectedIconTheme: const IconThemeData(
            color: AppColors.secondaryColor,
          ),
          unselectedItemColor: AppColors.hintTextColor,
          unselectedIconTheme: const IconThemeData(
            color: AppColors.hintTextColor,
          ),
          type: BottomNavigationBarType.fixed,
        ),

        //------------- Tab Bar -------------//
        tabBarTheme: TabBarTheme(
          labelStyle: AppTextStyle.bodyLarge(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTextStyle.bodyLarge(),
          dividerColor: AppColors.secondaryColor,
          labelColor: AppColors.primaryColor,
          indicatorColor: AppColors.primaryColor,
          unselectedLabelColor: AppColors.hintTextColor,
          indicator: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(50.sp),
          ),
          splashFactory: NoSplash.splashFactory,
        ),

        //------------- Text Button -------------//
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48.h),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.h),
              side: const BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),

        //------------- Divider -------------//
        dividerTheme:
            const DividerThemeData(thickness: 1, color: AppColors.surfaceColor),

        //------------- Transition -------------//
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        datePickerTheme: DatePickerThemeData(
          dayStyle: AppTextStyle.bodyMedium(),
          yearStyle: AppTextStyle.bodyMedium(),
          weekdayStyle: AppTextStyle.bodyMedium(),
        ),
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: AppColors.primaryColor,
          brightness: Brightness.light,
          scaffoldBackgroundColor: AppColors.backgroundColor,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(background: AppColors.backgroundColor),
      );
}
