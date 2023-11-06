import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/mixin/repository_mixin.dart';
import 'package:gimme_delivery/features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:gimme_delivery/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository
    with RepositoryMixin {
  final AuthenticationRemoteDatasource _remoteDatasource =
      getIt<AuthenticationRemoteDatasource>();

  @override
  Future<Either<Failure, void>> registerAccount(
          String name, String email, String password) =>
      callDataSource(
          () => _remoteDatasource.registerAccount(name, email, password));

  @override
  Future<Either<Failure, SignInResult>> loginAccount(
          String email, String password) =>
      callDataSource(() => _remoteDatasource.loginAccount(email, password));

  @override
  Future<Either<Failure, void>> verifyAccount(String email, String code) =>
      callDataSource(() async {
        return await _remoteDatasource.verifyAccount(email, code);
      });
}
