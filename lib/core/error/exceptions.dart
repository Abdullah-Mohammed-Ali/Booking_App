import 'package:booking_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({required this.message});
}

class AuthException implements Exception {
  final String errorMessage;

  AuthException(this.errorMessage);
}
