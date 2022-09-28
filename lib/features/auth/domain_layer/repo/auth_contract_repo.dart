import 'package:booking_app/features/auth/domain_layer/entity/user.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../use_cases/register_use_case.dart';

abstract class AuthContractRepo {
  Future<Either<Failure, AuthUserEntity>> login(LoginParameter parameters);
  Future<Either<Failure, AuthUserEntity>> register(
      RegisterParameter parameters);
}
