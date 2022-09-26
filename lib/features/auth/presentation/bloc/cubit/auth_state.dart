part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthCubitInitial extends AuthState {}

class AuthProfileImageLoading extends AuthState {}

class AuthProfileImageSuccess extends AuthState {}

class AuthProfileImageError extends AuthState {}

class ShowPasswordState extends AuthState {}
