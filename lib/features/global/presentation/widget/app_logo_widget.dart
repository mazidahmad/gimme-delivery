import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app_logo',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
                text: 'GIMME',
                style: AppTextStyle.displayLarge(color: AppColors.primaryColor)
                    .copyWith(fontSize: 42.sp),
                children: [
                  TextSpan(
                    text: 'DELIVERY',
                    style: AppTextStyle.displayLarge().copyWith(
                        fontSize: 42.sp,
                        height: 1,
                        color: AppColors.secondaryTextColor),
                  ),
                ]),
          ),
          Text(
            'Your delivery partner',
            style: AppTextStyle.bodyMedium(color: AppColors.secondaryTextColor),
          )
        ],
      ),
    );
  }
}
