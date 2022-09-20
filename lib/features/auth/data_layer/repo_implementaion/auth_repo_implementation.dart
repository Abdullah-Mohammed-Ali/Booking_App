import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../booking/domain_layer/entities/user_entity.dart';

class AuthRepoImplementation extends AuthContractRepo<UserEntity> {
  @override
  Future<Either<Failure, UserEntity>> login() async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
