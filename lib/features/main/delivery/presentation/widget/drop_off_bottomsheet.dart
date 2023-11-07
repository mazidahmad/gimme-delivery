import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_text_form_field.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/drop_off_cubit.dart';
import 'package:gimme_delivery/router/app_router.dart';

class DropOffBottomsheetWidget extends StatefulWidget {
  const DropOffBottomsheetWidget({
    super.key,
    required this.cubit,
  });

  final DropOffCubit cubit;

  @override
  State<DropOffBottomsheetWidget> createState() =>
      _DropOffBottomsheetWidgetState();
}

class _DropOffBottomsheetWidgetState extends State<DropOffBottomsheetWidget>
    with MessagerMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (ctx, isKeyboardVisible) {
        return BlocConsumer<DropOffCubit, DropOffState>(
          bloc: widget.cubit,
          listener: (context, state) {
            if (state.status == DropOffStateStatus.failed) {
              showAppToast(
                  message: state.failure!.message, type: ToastType.error);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  bottom: isKeyboardVisible ? 340.h : 0),
              child: Form(
                key: widget.cubit.dropOffForm,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: widget.cubit.nameController,
                      validator: (value) =>
                          widget.cubit.fieldValidator('Name', value),
                      hint: 'Input receiver name',
                      label: 'Name',
                    ),
                    Gap(20.h),
                    AppTextFormField(
                      controller: widget.cubit.phoneController,
                      validator: (value) =>
                          widget.cubit.fieldValidator('Phone', value),
                      hint: 'Input receiver phone',
                      label: 'Phone',
                    ),
                    Gap(20.h),
                    AppTextFormField(
                      controller: widget.cubit.notesController,
                      hint: 'Input notes',
                      label: 'Notes',
                    ),
                    Gap(40.h),
                    SizedBox(
                      width: double.infinity,
                      child: AppPrimaryButton(
                        text: 'Next',
                        onPressed: () {
                          if (widget.cubit.dropOffForm.currentState!
                              .validate()) {
                            getIt<AppRouter>().pop();
                            widget.cubit.submitDropOffRequest();
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
