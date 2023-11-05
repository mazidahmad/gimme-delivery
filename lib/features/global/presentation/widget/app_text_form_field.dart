import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.hint = '',
    this.controller,
    this.prefixIcon,
    this.isObscured = false,
    this.validator,
    this.label,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final bool isObscured;
  final String? Function(String?)? validator;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Column(
            children: [
              Text(
                label!,
                style: AppTextStyle.headlineMedium(),
              ),
              Gap(12.h),
            ],
          ),
        TextFormField(
          validator: validator,
          controller: controller,
          obscureText: isObscured,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
            filled: true,
            prefixIconColor: AppColors.hintTextColor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: AppTextStyle.bodyLarge(color: AppColors.hintTextColor)
                .copyWith(height: 0),
            fillColor: AppColors.textfieldBackgroundColor,
            focusColor: AppColors.textfieldBackgroundColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: BorderSide(
                color: AppColors.hintTextColor,
                width: 1.sp,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.sp,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: BorderSide(
                color: AppColors.hintTextColor,
                style: BorderStyle.solid,
                width: 1.sp,
              ),
            ),
            prefixIcon: prefixIcon,
          ),
          style: AppTextStyle.bodyLarge(color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}
