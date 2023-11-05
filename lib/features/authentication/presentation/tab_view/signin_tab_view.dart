import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_text_form_field.dart';

class SigninTabView extends StatelessWidget {
  const SigninTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        child: Column(
          children: [
            const AppTextFormField(
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            Gap(20.h),
            const AppTextFormField(
              label: 'Password',
              isObscured: true,
              hint: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline_rounded),
            ),
            Gap(40.h),
            SizedBox(
              width: double.infinity,
              child: AppPrimaryButton(
                text: 'Sign In',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
