import 'dart:io';

import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String? email;
  final String? password;
  final String? name;
  final File? imagePath;
  const AuthUser({
    this.imagePath,
    this.email,
    this.password,
    this.name,
  });
  @override
  List<Object?> get props => [
        email,
        password,
        name,
      ];
}
