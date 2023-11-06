import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/network_exception.dart' as exception;
import 'package:gimme_delivery/core/network/amplify_module.dart';
import 'package:injectable/injectable.dart';

abstract class AuthenticationRemoteDatasource {
  Future<SignInResult> loginAccount(String email, String password);
  Future<SignUpResult> registerAccount(
      String name, String email, String password);
  Future<void> verifyAccount(String email, String code);
}

@Injectable(as: AuthenticationRemoteDatasource)
class AuthenticationRemoteDatasourceImpl
    extends AuthenticationRemoteDatasource {
  final AmplifyModule _ampModule = getIt<AmplifyModule>();

  @override
  Future<SignInResult> loginAccount(String email, String password) async {
    return await _ampModule.amplify.Auth
        .signIn(username: email, password: password);
  }

  @override
  Future<SignUpResult> registerAccount(
      String name, String email, String password) async {
    try {
      return await _ampModule.amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: {
            AuthUserAttributeKey.email: email,
            AuthUserAttributeKey.name: name,
          },
        ),
      );
    } on UsernameExistsException catch (_) {
      throw const exception.RequestException('Register',
          errMessage:
              'Account already registered, please use another email or login with the email');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> verifyAccount(String email, String code) async {
    var result = await _ampModule.amplify.Auth
        .confirmSignUp(username: email, confirmationCode: code);

    if (!result.isSignUpComplete) {
      throw const exception.NetworkException(
          errMessage: 'Verification Account Failed');
    }
  }
}
