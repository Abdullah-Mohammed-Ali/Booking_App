import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';



abstract class HotelsState extends Equatable {
  const HotelsState();

  @override
  List<Object> get props => [];
}

class HotelsInitial extends HotelsState {}

class HotelsLoadingState extends HotelsState {}

class HotelsSuccessState extends HotelsState {}

class ErrorState extends HotelsState {
  final PrimaryServerException exception;

  const ErrorState({
    required this.exception,
  });
}
