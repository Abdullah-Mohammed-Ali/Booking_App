import 'package:booking_app/features/home_nav/domain_layer/entities/filter/hotel_images_entity.dart';

class HotelImagesModel extends HotelImages {
  const HotelImagesModel({
    required super.id,
    required super.hotelId,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory HotelImagesModel.fromJson(Map<String, dynamic> json) =>
      HotelImagesModel(
        id: json['id'],
        hotelId: json['hotel_id'],
        image: json['image'],
        createdAt: json['created_at'] ?? 'empty',
        updatedAt: json['updated_at'] ?? 'empty',
        // createdAt: DateTime.parse(json['created_at']),
        // updatedAt: DateTime.parse(json['updated_at']),
      );
}
