import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/mixin/repository_mixin.dart';
import 'package:gimme_delivery/features/startup/data/datasources/startup_remote_datasource.dart';
import 'package:gimme_delivery/features/startup/domain/repositories/startup_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StartupRepository)
class StartupRepositoryImpl extends StartupRepository with RepositoryMixin {
  final StartupRemoteDatasource _remoteDatasource =
      getIt<StartupRemoteDatasource>();

  @override
  Future<Either<Failure, void>> initializeAmplifyConfiguration() =>
      callDataSource(() => _remoteDatasource.initializeAmplifyConfiguration());

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() =>
      callDataSource(() => _remoteDatasource.getCurrentUser());
}
