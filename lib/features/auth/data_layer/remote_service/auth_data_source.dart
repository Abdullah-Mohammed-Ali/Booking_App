import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/error_message_model.dart';
import '../../domain_layer/entity/auth_user.dart';
import '../models/user_model.dart';

abstract class AuthContractDataSource {
  Future<AuthUserModel> login(AuthUser authUser);
  Future<AuthUserModel> register(AuthUser authUser);
}

class AuthDataSource extends AuthContractDataSource {
  final Dio _dio;

  AuthDataSource(this._dio);
  @override
  Future<AuthUserModel> login(AuthUser authUser) async {
    final Response response =
        await _dio.post(ApiConstants.loginAuthPath(), queryParameters: {
      QueryParametersHeaders.authName: authUser.name,
      QueryParametersHeaders.authEmail: authUser.email,
      QueryParametersHeaders.authPass: authUser.password,
      QueryParametersHeaders.authPassConfirmation: authUser.password,
    });

    if (response.statusCode == 200) {
      if (response.data['status']['type'] == 0) {
        throw AuthException(response.data['status']['title']['en']);
      } else {
        return AuthUserModel.fromJson(response.data['data']);
      }
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<AuthUserModel> register(AuthUser authUser) async {
    final Response response =
        await _dio.post(ApiConstants.registerAuthPath(), queryParameters: {
      QueryParametersHeaders.authName: authUser.name,
      QueryParametersHeaders.authEmail: authUser.email,
      QueryParametersHeaders.authPass: authUser.password,
      QueryParametersHeaders.authPassConfirmation: authUser.password,
    });

    if (response.statusCode == 200) {
      if (response.data['status']['type'] == 0) {
        throw AuthException(response.data['status']['title']['en']);
      } else {
        return AuthUserModel.fromJson(response.data['data']);
      }
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
