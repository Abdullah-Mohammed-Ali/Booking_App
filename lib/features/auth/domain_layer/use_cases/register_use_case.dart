import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/auth/data_layer/repo_implementaion/auth_repo_implementation.dart';
import 'package:booking_app/features/auth/domain_layer/entity/user.dart';
import 'package:booking_app/features/auth/domain_layer/repo/auth_contract_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../../../booking/domain_layer/entities/user_entity.dart';
import '../entity/auth_user.dart';

class RegisterUseCase extends BaseUseCase<AuthUserEntity, RegisterParameter> {
  final AuthContractRepo _authContractRepo;

  RegisterUseCase(this._authContractRepo);

  @override
  Future<Either<Failure, AuthUserEntity>> call(parameters) async {
    return await _authContractRepo.register(parameters);
  }
}

class RegisterParameter extends Equatable {
  final AuthUser authUser;

  const RegisterParameter(this.authUser);

  @override
  List<Object?> get props => [authUser];
}
