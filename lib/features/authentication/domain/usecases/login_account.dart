import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginAccount {
  final AuthenticationRepository _repo = getIt<AuthenticationRepository>();

  Future<Either<Failure, SignInResult>> execute(
          String email, String password) =>
      _repo.loginAccount(email, password);
}
