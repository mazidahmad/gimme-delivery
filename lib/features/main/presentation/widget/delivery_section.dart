import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class DeliverySection extends StatelessWidget {
  const DeliverySection({
    super.key,
    required this.name,
    required this.locationName,
    required this.address,
    this.isReceiver = false,
  });

  final String name;
  final String locationName;
  final String address;
  final bool isReceiver;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isReceiver ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            name,
            textAlign: isReceiver ? TextAlign.end : TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: AppTextStyle.headlineSmall(),
          ),
          Gap(5.h),
          Text(
            locationName,
            maxLines: 1,
            textAlign: isReceiver ? TextAlign.end : TextAlign.start,
            overflow: TextOverflow.fade,
            style: AppTextStyle.headlineSmall(
              color: AppColors.primaryColor,
            ),
          ),
          Gap(5.h),
          Text(
            address,
            style: AppTextStyle.bodySmall(
              color: AppColors.hintTextColor,
            ),
            textAlign: isReceiver ? TextAlign.end : TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
