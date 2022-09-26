import 'dart:io';

import 'package:booking_app/features/auth/domain_layer/entity/auth_user.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/login_use_case.dart';
import 'package:booking_app/features/auth/domain_layer/use_cases/register_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._RegisterUseCase)
      : super(AuthCubitInitial());

  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _RegisterUseCase;
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
        this.profileImage = imageFile;
        emit(AuthProfileImageSuccess());
      }
    } catch (e) {
      emit(AuthProfileImageError());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error in loading the image, please try again'),
      ));
    }
  }

  void showPassword(bool password) {
    emit(ShowPasswordState());
    password = !password;
    emit(ShowPasswordState());
  }

  Future login() async {
    var parameters = LoginParameter(createAuthUser(true));
    var result = await _loginUseCase.call(parameters);
    result.fold((l) => null, (r) => null);
  }

  Future register() async {
    var parameters = RegisterParameter(createAuthUser(false));
    var result = await _RegisterUseCase.call(parameters);
    result.fold((l) => null, (r) => null);
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
