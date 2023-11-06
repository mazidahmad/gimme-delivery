import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/authentication/domain/usecases/signup_account.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@Injectable()
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final SignUpAccount _signUp = getIt<SignUpAccount>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void registerAccount() async {
    if (registerFormKey.currentState!.validate()) {
      emit(RegisterLoading());

      var result = await _signUp.execute(
          nameController.text, emailController.text, passwordController.text);

      emit(
        result.fold(
          (failure) => RegisterFailed(failure: failure),
          (_) => RegisterSuccess(),
        ),
      );
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  String? fieldValidator(String type, String? value) {
    if (value == null || value.isEmpty) {
      return '$type required';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value != passwordController.text) {
      return "Password doesn't match";
    }
    return null;
  }
}
