import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/authentication/presentation/cubit/verification_cubit.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationPage extends StatefulWidget {
  const VerificationPage({required this.email, super.key});

  static const String routeName = '/verification-page';

  final String email;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    with MessagerMixin {
  late final TextEditingController _controller;
  late final VerificationCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<VerificationCubit>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocListener<VerificationCubit, VerificationState>(
        listener: (context, state) async {
          if (state is VerificationLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state is VerificationSuccess) {
              showAppToast(
                  message: "Congratulations, Your account was verified!",
                  type: ToastType.success);
              await getIt<AppRouter>()
                  .replaceAll([AuthenticationRoute(initialIndex: 1)]);
            } else if (state is VerificationFailed) {
              showAppToast(
                  message: state.failure.message, type: ToastType.error);
            }
          }
        },
        child: Scaffold(
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
                      RichText(
                        text: TextSpan(
                            text:
                                'We have sent the code verification to\nyour email ',
                            style: AppTextStyle.bodyMedium(
                                    color: AppColors.hintTextColor)
                                .copyWith(height: 1.2),
                            children: [
                              TextSpan(
                                text: widget.email,
                                style: AppTextStyle.headlineSmall()
                                    .copyWith(height: 1.2),
                              )
                            ]),
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
                          onPressed: () => _cubit.verifyAccount(
                              widget.email, _controller.text),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
