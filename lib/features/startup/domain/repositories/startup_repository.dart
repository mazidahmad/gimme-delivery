import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';

abstract class StartupRepository {
  Future<Either<Failure, void>> initializeAmplifyConfiguration();
  Future<Either<Failure, AuthUser?>> getCurrentUser();
}
