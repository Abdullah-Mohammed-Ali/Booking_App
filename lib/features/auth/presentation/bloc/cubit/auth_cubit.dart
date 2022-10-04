import 'dart:io';

import 'package:booking_app/features/auth/domain_layer/entity/auth_user.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/register_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/shared_pref_use_cases/shared_pref_get_use_case.dart';
import 'package:booking_app/features/auth/presentation/const_strings.dart';
import 'package:booking_app/routing/app_routing_names.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/globals.dart';
import '../../../domain_layer/use_cases/shared_pref_use_cases/shared_pref_post_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._RegisterUseCase,
      this._shaerdPrefGetUseCase, this._shaerdPrefPostUseCase)
      : super(AuthCubitInitial());

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _RegisterUseCase;
  final SharedPrefGetUseCase _shaerdPrefGetUseCase;
  final SharedPrefPostUseCase _shaerdPrefPostUseCase;
  static AuthCubit get(context) => BlocProvider.of(context);

  File? profileImage;
  bool isPasswordNotObscure = false;
  bool isPasswordConfirmationNotObscure = false;
  Future getProfileImage(BuildContext context) async {
    emit(AuthProfileImageLoading());
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        File imageFile = File.fromUri(Uri.file(image.path));
        profileImage = imageFile;
        emit(AuthProfileImageSuccess());
      }
    } catch (e) {
      emit(AuthProfileImageError());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error in loading the image, please try again'),
      ));
    }
  }

  bool showPassword(bool password) {
    emit(ShowPasswordState());
    return password = !password;
  }

  Future login(BuildContext context) async {
    var parameters = LoginParameter(createAuthUser(true));
    emit(AuthSignInLoading());
    var result = await _loginUseCase.call(parameters);

    result.fold((l) {
      emit(AuthSignInError(l.message));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) async {

      await _shaerdPrefPostUseCase.call(
          value: r.apiToken, key: sharedApiTokenKey);
      Navigator.pushReplacementNamed(context, AppRoutingNames.homeNavScreen);

      emit(AuthSignInSuccess());
    });
  }

  Future register(BuildContext context) async {
    var parameters = RegisterParameter(createAuthUser(false));
    emit(AuthSignupLoading());
    var result = await _RegisterUseCase.call(parameters);
    result.fold((l) {
      emit(AuthSignupError(l.message));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l.message),
      ));
    }, (r) async {

      GlobalApiToken=r.apiToken!;
      print('Api token : ' + r.apiToken!);


      await _shaerdPrefPostUseCase.call(
          value: r.apiToken, key: sharedApiTokenKey);
      Navigator.pushReplacementNamed(context, AppRoutingNames.homeNavScreen);

      emit(AuthSignInSuccess());
    });
  }

  AuthUser createAuthUser(bool isLogin) {
    if (isLogin) {
      return AuthUser(
          password: passwordController.text, email: emailController.text);
    } else {
      return AuthUser(
          name: usernameController.text,
          password: passwordController.text,
          email: emailController.text,
          imagePath: profileImage);
    }
  }
}
