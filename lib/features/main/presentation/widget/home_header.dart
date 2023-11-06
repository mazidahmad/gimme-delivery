import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.appbar,
    required this.name,
  });

  final AppBar appbar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      width: double.infinity,
      color: const Color.fromRGBO(29, 39, 47, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(appbar.preferredSize.height),
          RichText(
            text: TextSpan(
              text: 'GIMME',
              style: AppTextStyle.headlineLarge(color: AppColors.primaryColor),
              children: [
                TextSpan(
                  text: 'DELIVERY',
                  style: AppTextStyle.headlineLarge(
                      color: AppColors.secondaryTextColor),
                )
              ],
            ),
          ),
          Gap(20.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $name!',
                    style: AppTextStyle.headlineMedium(
                        color: AppColors.secondaryTextColor),
                  ),
                  Gap(10.h),
                  Text(
                    "Ready for delivery things?",
                    style: AppTextStyle.headlineSmall(
                        color: AppColors.secondaryTextColor),
                  ),
                ],
              ),
              const Spacer(),
              const AppAvatar(),
            ],
          ),
          Gap(120.h),
        ],
      ),
    );
  }
}
