import 'package:equatable/equatable.dart';

class ErrorMessageModel extends ErrorMessage {
  const ErrorMessageModel({required super.error});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) => ErrorMessageModel(
    error: ErrorModel.fromJson(json['error']),
  );
}

class ErrorMessage extends Equatable {
  final Error error;

  const ErrorMessage({required this.error});

  @override
  List<Object> get props => [error];
}

class Error extends Equatable {
  final int code;
  final String message;

  const Error({required this.code, required this.message});

  @override
  List<Object> get props => [code, message];
}

class ErrorModel extends Error {
  const ErrorModel({required super.code, required super.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    code: json['code'],
    message: json['message'],
  );
}