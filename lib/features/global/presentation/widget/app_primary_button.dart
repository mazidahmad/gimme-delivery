import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    this.text = 'Button',
    this.isLarge = false,
    this.color,
    this.onPressed,
    this.width,
    this.textColor,
    super.key,
  });

  final String text;
  final double? width;
  final void Function()? onPressed;
  final bool isLarge;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        backgroundColor: color ?? AppColors.primaryColor,
        minimumSize: Size(width ?? 100.w, 55.h),
        maximumSize: Size(double.infinity, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.sp),
        ),
        shadowColor: Colors.transparent,
        disabledBackgroundColor: AppColors.primaryColor.withOpacity(0.1),
        textStyle: AppTextStyle.headlineLarge(
                color: textColor ?? AppColors.secondaryTextColor)
            .copyWith(height: 0),
        elevation: 0,
      ).copyWith(
        elevation: ButtonStyleButton.allOrNull(0),
      ),
      child: Text(
        text,
        style: isLarge
            ? AppTextStyle.headlineLarge(
                    color: textColor ?? AppColors.secondaryTextColor)
                .copyWith(height: 0)
            : AppTextStyle.headlineMedium(
                    color: textColor ?? AppColors.secondaryTextColor)
                .copyWith(height: 0),
      ),
    );
  }
}
