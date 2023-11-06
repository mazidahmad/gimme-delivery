import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/router/app_router.dart';

enum ToastType { info, success, error }

mixin MessagerMixin {
  final FToast _toast =
      FToast().init(getIt<AppRouter>().navigatorKey.currentContext!);

  void showAppToast(
      {ToastType type = ToastType.info, required String message}) async {
    late Color toastColor;
    switch (type) {
      case ToastType.error:
        toastColor = AppColors.red;
        break;
      case ToastType.success:
        toastColor = AppColors.green;
        break;
      default:
        toastColor = AppColors.secondaryColor;
    }
    _toast.showToast(
        toastDuration: const Duration(seconds: 3),
        child: Container(
          constraints: BoxConstraints(minHeight: 40.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: toastColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  size: 26.sp,
                  color: AppColors.textColor,
                ),
                Gap(12.w),
                Expanded(
                  child: Text(
                    message,
                    style: AppTextStyle.headlineSmall(),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM);
  }
}
