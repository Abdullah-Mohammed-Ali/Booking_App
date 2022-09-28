// ignore_for_file: non_constant_identifier_names


import 'images_model.dart';

class HotelModel {
  final String id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;
  final String created_at;
  final String updated_at;
  final HotelsDataImagesModel hotelsImages;

  HotelModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.created_at,
    required this.updated_at,
    required this.hotelsImages,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'],
      name: json['id'],
      description: json['id'],
      price: json['id'],
      address: json['id'],
      longitude: json['id'],
      latitude: json['id'],
      rate: json['id'],
      created_at: json['id'],
      updated_at: json['id'],
      hotelsImages: HotelsDataImagesModel.fromjson(json['hotel_images']),
    );
  }
}

class HotelsDataImagesModel {
  final List<HotelsImagesModel> hotelImages;

  HotelsDataImagesModel({
    required this.hotelImages,
  });

  factory HotelsDataImagesModel.fromjson(Map<String, dynamic> json) {
    return HotelsDataImagesModel(
      hotelImages: List<HotelsImagesModel>.from(
        json['hotel_images'].map(
          (x) => HotelsImagesModel.fromJson(x),
        ),
      ),
    );
  }
}
