import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/auth/data_layer/repo_implementaion/auth_repo_implementation.dart';
import 'package:booking_app/features/auth/domain_layer/entity/user.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../entity/auth_user.dart';

class LoginUseCase extends BaseUseCase<AuthUserEntity, LoginParameter> {
  final AuthContractRepo _authContractRepo;

  LoginUseCase(this._authContractRepo);
  @override
  Future<Either<Failure, AuthUserEntity>> call(parameters) async {
    return await _authContractRepo.login(parameters);
  }
}

class LoginParameter extends Equatable {
  final AuthUser authUser;

  const LoginParameter(this.authUser);

  @override
  List<Object?> get props => [authUser];
}
