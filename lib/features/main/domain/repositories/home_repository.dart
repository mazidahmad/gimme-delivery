import 'package:dartz/dartz.dart';
import 'package:gimme_delivery/core/error/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, String>> getFullNameUser();
}
