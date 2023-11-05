import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationPage extends StatefulWidget {
  const VerificationPage({required this.email, super.key});

  static const String routeName = '/verification-page';

  final String email;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Gap(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verification Code',
                    style: AppTextStyle.headlineLarge(),
                  ),
                  Gap(10.h),
                  Text(
                    'We have sent the code verification to\nyour email ${widget.email}',
                    style:
                        AppTextStyle.bodyMedium(color: AppColors.hintTextColor),
                  ),
                  Gap(60.h),
                  Center(
                    child: Pinput(
                      length: 6,
                      controller: _controller,
                      textCapitalization: TextCapitalization.characters,
                      defaultPinTheme: PinTheme(
                        decoration: BoxDecoration(
                            color: AppColors.hintTextColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.sp)),
                        padding: EdgeInsets.all(10.sp),
                        textStyle: AppTextStyle.displaySmall(),
                        height: 50.h,
                        width: 50.w,
                      ),
                    ),
                  ),
                  Gap(60.h),
                  SizedBox(
                    width: double.infinity,
                    child: AppPrimaryButton(
                      text: 'Submit',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
