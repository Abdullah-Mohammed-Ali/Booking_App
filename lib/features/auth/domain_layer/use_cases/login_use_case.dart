import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/auth/data_layer/repo_implementaion/auth_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../../../booking/domain_layer/entities/user_entity.dart';
import '../entity/auth_user.dart';

class LoginUseCase extends BaseUseCase<UserEntity, LoginParameter> {
  final AuthRepoImplementation _authContractRepo;

  LoginUseCase(this._authContractRepo);
  @override
  Future<Either<Failure, UserEntity>> call(parameters) async {
    return await _authContractRepo.login();
  }
}

class LoginParameter extends Equatable {
  final AuthUser _authUser;

  const LoginParameter(this._authUser);

  @override
  // TODO: implement props
  List<Object?> get props => [_authUser];
}
