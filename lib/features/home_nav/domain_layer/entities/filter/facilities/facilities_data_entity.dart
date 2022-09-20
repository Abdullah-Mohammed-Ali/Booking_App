import 'package:equatable/equatable.dart';

class FacilitiesData extends Equatable {
  final int id;
  final String name;
  final String image;

  // final DateTime createdAt;
  // final DateTime updatedAt;

  final String createdAt;
  final String updatedAt;

  const FacilitiesData({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
    id,
    name,
    image,
    createdAt,
    updatedAt,
  ];
}
