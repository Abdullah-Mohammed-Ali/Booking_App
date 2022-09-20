import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final String type;

  const Status({required this.type});

  @override
  List<Object> get props => [type];
}