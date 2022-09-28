// ignore_for_file: non_constant_identifier_names

import 'images_model.dart';

class HotelModel {
  final int id;
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
    print(json['hotel_images']);
    return HotelModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      rate: json['rate'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      hotelsImages: HotelsDataImagesModel.fromjson(json['hotel_images']),
    );
  }
}

class HotelsDataImagesModel {
  final List<HotelsImagesModel> hotelImages;

  HotelsDataImagesModel({
    required this.hotelImages,
  });

  factory HotelsDataImagesModel.fromjson(List<dynamic> json) {
    return HotelsDataImagesModel(
      hotelImages: json.map((e) {
        return HotelsImagesModel.fromJson(e);
      }).toList(),
    );
  }
}
