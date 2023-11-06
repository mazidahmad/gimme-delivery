import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppSearchFormField extends StatelessWidget {
  const AppSearchFormField({
    this.hint = '',
    this.controller,
    this.prefixIcon,
    this.validator,
    this.isReadOnly,
    this.onTap,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool? isReadOnly;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadOnly ?? false,
      validator: validator,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
        filled: true,
        prefixIconColor: AppColors.hintTextColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: AppTextStyle.bodyMedium(color: AppColors.hintTextColor)
            .copyWith(height: 0),
        fillColor: AppColors.surfaceColor,
        focusColor: AppColors.textfieldBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.sp),
          borderSide: BorderSide(
            color: AppColors.hintTextColor,
            width: 1.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.sp),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1.sp,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.sp),
          borderSide: BorderSide(
            color: AppColors.hintTextColor,
            style: BorderStyle.solid,
            width: 1.sp,
          ),
        ),
        prefixIcon: prefixIcon,
      ),
      style: AppTextStyle.bodyMedium(color: AppColors.secondaryColor),
    );
  }
}
