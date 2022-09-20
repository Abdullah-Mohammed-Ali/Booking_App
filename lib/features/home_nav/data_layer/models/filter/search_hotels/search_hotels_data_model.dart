import 'package:booking_app/features/home_nav/data_layer/models/filter/facilities/facilities_data_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/hotel_images_model.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_data_entity.dart';

class SearchHotelsDataModel extends SearchHotelsData {
  const SearchHotelsDataModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.address,
    required super.longitude,
    required super.latitude,
    required super.rate,
    required super.createdAt,
    required super.updatedAt,
    required super.hotelImages,
    required super.facilities,
  });

  factory SearchHotelsDataModel.fromJson(Map<String, dynamic> json) =>
      SearchHotelsDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        address: json['address'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        rate: json['rate'],
        createdAt: json['created_at'] ?? 'empty',
        updatedAt: json['updated_at'] ?? 'empty',
        // createdAt: DateTime.parse(json['created_at']),
        // updatedAt: DateTime.parse(json['updated_at']),
        hotelImages: List<HotelImagesModel>.from(json['hotel_images'].map((e) => HotelImagesModel.fromJson(e))),
        facilities: List<FacilitiesDataModel>.from(json['facilities'].map((e)=>FacilitiesDataModel.fromJson(e))),
      );

}
