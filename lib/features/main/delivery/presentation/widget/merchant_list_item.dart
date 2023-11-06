import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/data/models/model_provider.dart';

class MerchantListItem extends StatelessWidget {
  const MerchantListItem({
    super.key,
    required this.merchant,
    required this.onTap,
  });

  final MerchantModel merchant;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            child: Row(
              children: [
                const Icon(
                  Icons.place_rounded,
                  color: AppColors.primaryColor,
                ),
                Gap(12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        merchant.merchant_name,
                        style: AppTextStyle.headlineSmall(),
                      ),
                      Gap(4.h),
                      Text(
                        merchant.address,
                        style: AppTextStyle.bodySmall(
                          color: AppColors.hintTextColor,
                        ).copyWith(height: 1.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
