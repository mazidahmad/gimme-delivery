import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/startup/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetCurrentUser {
  final StartupRepository _repo = getIt<StartupRepository>();

  Future<Either<Failure, AuthUser?>> execute() => _repo.getCurrentUser();
}
