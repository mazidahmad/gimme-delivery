import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/authentication/domain/usecases/verify_account.dart';
import 'package:injectable/injectable.dart';

part 'verification_state.dart';

@Injectable()
class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  final VerifyAccount _verifyAccount = getIt<VerifyAccount>();

  void verifyAccount(String email, String code) async {
    emit(VerificationLoading());

    var result = await _verifyAccount.execute(email, code);

    emit(
      result.fold(
        (failure) => VerificationFailed(failure: failure),
        (_) => VerificationSuccess(),
      ),
    );
  }
}
