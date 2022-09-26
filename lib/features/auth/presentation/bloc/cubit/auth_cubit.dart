import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  File? profileImage;
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
}
