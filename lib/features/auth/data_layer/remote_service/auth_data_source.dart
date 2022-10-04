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
    print(response.data);
    if (response.statusCode == 200) {
      if (response.data['status']['type'] == '0') {
        print(2);
        throw AuthException(response.data['status']['title']['en']);
      } else {
        print(3);
        return AuthUserModel.fromJson(response.data['data']);
      }
    } else {
      print(4);
      throw AuthException(response.data['status']['title']['en']);
    }
  }

  @override
  Future<AuthUserModel> register(AuthUser authUser) async {



    print("pathhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhjjjjjjjjjjjjjjjjjjj");

    print( authUser.imagePath!.path);
    print( authUser.imagePath!.path.split('/').last);



    FormData formData = FormData.fromMap({
      QueryParametersHeaders.authName: authUser.name,
      QueryParametersHeaders.authEmail: authUser.email,
      QueryParametersHeaders.authPass: authUser.password,
      QueryParametersHeaders.authPassConfirmation: authUser.password,
      QueryParametersHeaders.image:await  MultipartFile.fromFile(
          authUser.imagePath!.path,
          filename: authUser.imagePath!.path.split('/').last),


    });


    final Response response =
        await _dio.post(ApiConstants.registerAuthPath(),
    data: formData


    //         queryParameters: {
    //   QueryParametersHeaders.authName: authUser.name,
    //   QueryParametersHeaders.authEmail: authUser.email,
    //   QueryParametersHeaders.authPass: authUser.password,
    //   QueryParametersHeaders.authPassConfirmation: authUser.password,
    //   QueryParametersHeaders.image: MultipartFile.fromFile(
    //       authUser.imagePath!.path,
    //       filename: authUser.imagePath!.path.split('/').last),
    //
    //
    //
    // }


    );

    if (response.statusCode == 200) {
      if (response.data['status']['type'] == '0') {
        throw AuthException(response.data['status']['title']['en']);
      } else {
        return AuthUserModel.fromJson(response.data['data']);
      }
    } else {
      throw AuthException(response.data['status']['title']['en']);
    }
  }
}
