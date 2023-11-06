import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppSmallButton extends StatelessWidget {
  const AppSmallButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final void Function()? onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(
            color: AppColors.hintTextColor.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: AppColors.primaryColor,
              size: 20.sp,
            ),
            Gap(5.w),
            Text(
              label,
              style: AppTextStyle.bodySmall().copyWith(height: 0),
            )
          ],
        ),
      ),
    );
  }
}
