import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/auth/data_layer/remote_service/auth_data_source.dart';
import 'package:booking_app/features/auth/domain_layer/entity/auth_user.dart';
import 'package:booking_app/features/auth/domain_layer/entity/user.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/register_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../booking/domain_layer/entities/user_entity.dart';

class AuthRepoImplementation extends AuthContractRepo {
  final AuthDataSource _dataSource;

  AuthRepoImplementation(this._dataSource);

  @override
  Future<Either<Failure, AuthUserEntity>> register(
      RegisterParameter parameters) async {
    try {
      return await _dataSource
          .register(parameters.authUser)
          .then((value) => Right(value));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUserEntity>> login(
      LoginParameter parameters) async {
    try {
      return await _dataSource
          .login(parameters.authUser)
          .then((value) => Right(value));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
