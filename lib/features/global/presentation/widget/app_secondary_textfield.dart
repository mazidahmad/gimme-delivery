import 'package:flutter/material.dart';
import 'package:gimme_delivery/core/theme/theme.dart';

class AppSecondaryTextField extends StatelessWidget {
  const AppSecondaryTextField({
    this.hint = '',
    this.onTap,
    this.isReadOnly = false,
    this.controller,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;
  final void Function()? onTap;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: isReadOnly,
      style: AppTextStyle.bodyMedium(color: AppColors.textColor)
          .copyWith(height: 1),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(),
        prefixIconColor: AppColors.hintTextColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: AppTextStyle.bodyMedium(color: AppColors.hintTextColor)
            .copyWith(height: 1),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
