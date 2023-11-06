import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/di/service_locator.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/mixin/repository_mixin.dart';
import 'package:gimme_delivery/features/main/data/datasources/home_remote_datasource.dart';
import 'package:gimme_delivery/features/main/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  final HomeRemoteDatasource _remoteDatasource = getIt<HomeRemoteDatasource>();

  @override
  Future<Either<Failure, String>> getFullNameUser() =>
      callDataSource(() => _remoteDatasource.getFullNameUser());
}
