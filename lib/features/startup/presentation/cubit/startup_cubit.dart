import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/startup/domain/usecases/get_current_user.dart';
import 'package:gimme_delivery/features/startup/domain/usecases/initialize_amplify_configuration.dart';
import 'package:injectable/injectable.dart';

part 'startup_state.dart';

@Injectable()
class StartupCubit extends Cubit<StartupState> {
  StartupCubit() : super(StartupInitial());

  final InitializeAmplifyConfiguration _initializeAmplifyConfiguration =
      getIt<InitializeAmplifyConfiguration>();
  final GetCurrentUser _getCurrentUser = getIt<GetCurrentUser>();

  void initializeStartup() async {
    emit(StartupLoading());

    var result = await _initializeAmplifyConfiguration.execute();

    emit(
      result.fold(
        (failure) => StartupFailed(failure: failure),
        (_) => StartupConfiguredLoaded(),
      ),
    );

    checkCurrentSession();
  }

  void checkCurrentSession() async {
    emit(StartupLoading());

    var result = await _getCurrentUser.execute();

    emit(
      result.fold(
        (failure) => StartupFailed(failure: failure),
        (account) {
          if (account != null) return StartupLoggedIn();
          return StartupNotLoggedIn();
        },
      ),
    );
  }
}
