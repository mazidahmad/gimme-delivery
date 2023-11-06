import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';
import 'package:gimme_delivery/core/error/network_exception.dart';

mixin RepositoryMixin {
  Future<Either<Failure, T>> callDataSource<T>(
      Future<T> Function() call) async {
    try {
      return Right(await call());
    } on RequestException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on SessionException catch (e) {
      return Left(SessionExpiredFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } catch (e, stackTrace) {
      log('log-error: ', stackTrace: stackTrace);
      return Left(DeviceFailure(e.toString()));
    }
  }
}
