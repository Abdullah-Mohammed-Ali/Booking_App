
import 'package:booking_app/core/network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception{
  final String message;

  const LocalDatabaseException({required this.message});
}

// Tolba's Errors

class PrimaryServerException implements Exception {
  final String error;
  final String message;
  final int code;

  PrimaryServerException({
    required this.error,
    required this.message,
    required this.code,
  });
}
