import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SignUpAccount {
  final AuthenticationRepository _repo = getIt<AuthenticationRepository>();

  Future<Either<Failure, void>> execute(
          String name, String email, String password) =>
      _repo.registerAccount(name, email, password);
}
