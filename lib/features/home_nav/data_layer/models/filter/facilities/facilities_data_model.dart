
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_data_entity.dart';

class FacilitiesDataModel extends FacilitiesData {
  const FacilitiesDataModel({
    required super.id,
    required super.name,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FacilitiesDataModel.fromJson(Map<String, dynamic> json) =>
      FacilitiesDataModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        createdAt: json['created_at'] ?? 'empty',
        updatedAt: json['updated_at'] ?? 'empty',
        // createdAt: DateTime.parse(json['created_at']),
        // updatedAt: DateTime.parse(json['updated_at']),
      );
}
