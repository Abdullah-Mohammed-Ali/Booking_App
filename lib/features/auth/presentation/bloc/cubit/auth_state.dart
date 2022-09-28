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

class AuthSignInLoading extends AuthState {}

class AuthSignInError extends AuthState {
  final String errorMessage;

  const AuthSignInError(this.errorMessage);
}

class AuthSignInSuccess extends AuthState {}

class AuthSignupLoading extends AuthState {}

class AuthSignupError extends AuthState {
  final String errorMessage;

  const AuthSignupError(this.errorMessage);
}

class AuthSignupSuccess extends AuthState {}
