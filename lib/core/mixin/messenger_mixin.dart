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
                    style: AppTextStyle.headlineSmall(
                        color: AppColors.secondaryTextColor),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM);
  }

  Future<void> showAppModalBottomsheet(
          {required BuildContext context,
          required Widget Function(
                  BuildContext context, void Function(void Function()) setState)
              widget,
          String? title}) =>
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: AppColors.backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        builder: (_) => StatefulBuilder(
          builder: (context, setState) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(12.h),
                Container(
                  width: 80.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(3)),
                ),
                Gap(22.h),
                if (title != null) ...[
                  Text(
                    title,
                    style: AppTextStyle.headlineLarge(),
                  ),
                  Gap(18.h),
                  const Divider(),
                ],
                widget.call(context, setState),
              ],
            ),
          ),
        ),
      );
}
