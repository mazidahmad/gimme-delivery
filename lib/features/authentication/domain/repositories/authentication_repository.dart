import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, SignInResult>> loginAccount(
      String email, String password);
  Future<Either<Failure, void>> registerAccount(
      String name, String email, String password);
  Future<Either<Failure, void>> verifyAccount(String email, String code);
}
