import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String? email;
  final String? password;
  final String? name;

  const AuthUser({
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
