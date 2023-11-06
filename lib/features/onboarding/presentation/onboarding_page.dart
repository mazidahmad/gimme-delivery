import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_outlined_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';

import '../../../core/theme/theme.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  static const String routeName = '/on-boarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(AppAssets.onboardingHeader),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Gimme Delivery',
                      style: AppTextStyle.headlineLarge(),
                    ),
                    Gap(20.h),
                    Text(
                      'Gimme Delivery is the best solution to deliver and track goods from local and world shipping.',
                      style: AppTextStyle.bodyMedium(
                              color: AppColors.hintTextColor)
                          .copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    Gap(50.h),
                    AppPrimaryButton(
                      width: double.infinity,
                      text: 'Create Account',
                      onPressed: () => getIt<AppRouter>()
                          .push(AuthenticationRoute(initialIndex: 0)),
                    ),
                    Gap(15.h),
                    AppOutlinedButton(
                      width: double.infinity,
                      text: 'Sign In',
                      onPressed: () => getIt<AppRouter>()
                          .push(AuthenticationRoute(initialIndex: 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
