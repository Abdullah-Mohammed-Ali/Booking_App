import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_data_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/hotel_images_entity.dart';
import 'package:equatable/equatable.dart';

class SearchHotelsData extends Equatable {
  final int id;
  final String name;
  final String description;
  final String price;
  final String address;
  final String longitude;
  final String latitude;
  final String rate;

  // final DateTime createdAt;
  // final DateTime updatedAt;
  final String createdAt;
  final String updatedAt;
  final List<HotelImages> hotelImages;
  final List<FacilitiesData> facilities;

  const SearchHotelsData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.rate,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelImages,
    required this.facilities,
  });

  @override
  List<Object> get props =>
      [
        id,
        name,
        description,
        price,
        address,
        longitude,
        latitude,
        rate,
        createdAt,
        updatedAt,
        hotelImages,
        facilities,
      ];
}
