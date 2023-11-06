import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_text_form_field.dart';
import 'package:gimme_delivery/router/app_router.dart';
import 'package:gimme_delivery/router/app_router.gr.dart';

class SigninTabView extends StatelessWidget with MessagerMixin {
  SigninTabView({required this.cubit, super.key});

  final LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();

          if (state is LoginSuccess) {
            getIt<AppRouter>().replace(const MainRoute());
          } else if (state is LoginConfirmSignUp) {
            getIt<AppRouter>()
                .replace(VerificationRoute(email: cubit.emailController.text));
          } else if (state is LoginFailed) {
            showAppToast(message: state.failure.message, type: ToastType.error);
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: cubit.loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppTextFormField(
                  validator: (value) => cubit.fieldValidator('Email', value),
                  controller: cubit.emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                Gap(20.h),
                AppTextFormField(
                  validator: (value) => cubit.fieldValidator('Password', value),
                  controller: cubit.passwordController,
                  label: 'Password',
                  isObscured: true,
                  hint: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                ),
                Gap(40.h),
                SizedBox(
                  width: double.infinity,
                  child: AppPrimaryButton(
                    text: 'Sign In',
                    onPressed: () => cubit.loginAccount(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
