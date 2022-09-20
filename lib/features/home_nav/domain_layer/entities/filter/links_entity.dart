import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String url;
  final String label;
  final bool active;

  const Links({
    required this.url,
    required this.label,
    required this.active,
  });

  @override
  List<Object> get props => [
    url,
    label,
    active,
  ];
}
