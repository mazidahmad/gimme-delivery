import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class DeliveryBox extends StatelessWidget {
  const DeliveryBox({
    required this.icon,
    required this.iconColor,
    required this.name,
    required this.phone,
    required this.locationName,
    required this.address,
    super.key,
  });

  final IconData icon;
  final Color iconColor;
  final String name;
  final String phone;
  final String locationName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: AppColors.hintTextColor.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 20.sp,
              ),
              Gap(10.w),
              Expanded(
                child: Text(
                  name,
                  style: AppTextStyle.headlineSmall(),
                ),
              ),
              Gap(20.w),
              Expanded(
                child: Text(
                  phone,
                  textAlign: TextAlign.end,
                  style:
                      AppTextStyle.headlineSmall(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          Divider(color: AppColors.hintTextColor.withOpacity(0.2)),
          Text(
            locationName,
            style: AppTextStyle.headlineSmall(),
          ),
          Gap(4.h),
          Text(
            address,
            style: AppTextStyle.bodySmall(color: AppColors.hintTextColor)
                .copyWith(height: 1.2),
          ),
        ],
      ),
    );
  }
}
