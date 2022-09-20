
import 'package:booking_app/features/home_nav/data_layer/models/filter/facilities/facilities_data_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/status_model.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_entity.dart';

class FacilitiesModel extends Facilities {
  const FacilitiesModel({required super.status, required super.facilitiesData});

  factory FacilitiesModel.fromJson(Map<String, dynamic> json) =>
      FacilitiesModel(
        status: StatusModel.fromJson(json['status']),
        facilitiesData: List<FacilitiesDataModel>.from(json['data'].map((e)=>FacilitiesDataModel.fromJson(e))),
      );
}
