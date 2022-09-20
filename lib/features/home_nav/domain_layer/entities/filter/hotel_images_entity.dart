import 'package:equatable/equatable.dart';

class HotelImages extends Equatable {
  final int id;
  final String hotelId;
  final String image;

  // final DateTime createdAt;
  // final DateTime updatedAt;
  final String createdAt;
  final String updatedAt;

  const HotelImages({
    required this.id,
    required this.hotelId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [
    id,
    hotelId,
    image,
    createdAt,
    updatedAt
  ];
}
