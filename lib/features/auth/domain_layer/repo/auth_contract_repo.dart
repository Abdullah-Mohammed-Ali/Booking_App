import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class AuthContractRepo<T> {
  Future<Either<Failure, T>> login();
  Future<Either<Failure, T>> register();
}
