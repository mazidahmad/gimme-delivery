import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/mixin/messenger_mixin.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_primary_button.dart';
import 'package:gimme_delivery/features/global/presentation/widget/app_text_form_field.dart';
import 'package:gimme_delivery/features/main/delivery/presentation/cubit/pick_up_cubit.dart';
import 'package:gimme_delivery/router/app_router.dart';

class PickUpBottomsheetWidget extends StatefulWidget {
  const PickUpBottomsheetWidget({
    super.key,
    required this.cubit,
  });

  final PickUpCubit cubit;

  @override
  State<PickUpBottomsheetWidget> createState() =>
      _PickUpBottomsheetWidgetState();
}

class _PickUpBottomsheetWidgetState extends State<PickUpBottomsheetWidget>
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
        return BlocConsumer<PickUpCubit, PickUpState>(
          bloc: widget.cubit,
          listener: (context, state) {
            if (state.status == PickUpStateStatus.failed) {
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
                key: widget.cubit.pickupForm,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: widget.cubit.nameController,
                      validator: (value) =>
                          widget.cubit.fieldValidator('Name', value),
                      hint: 'Input sender name',
                      label: 'Name',
                    ),
                    Gap(20.h),
                    AppTextFormField(
                      controller: widget.cubit.phoneController,
                      validator: (value) =>
                          widget.cubit.fieldValidator('Phone', value),
                      hint: 'Input sender phone',
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
                          if (widget.cubit.pickupForm.currentState!
                              .validate()) {
                            getIt<AppRouter>().pop();
                            widget.cubit.submitPickUpRequest();
                          }
                        },
                      ),
                    ),
                    Gap(40.h),
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
