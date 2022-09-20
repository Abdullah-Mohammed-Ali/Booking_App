import 'package:booking_app/features/home_nav/data_layer/models/filter/search_hotels/search_hotels_all_data_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/status_model.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_entity.dart';

class SearchHotelsModel extends SearchHotels {
  const SearchHotelsModel({
    required super.status,
    required super.searchHotelsAllData,
  });

  factory SearchHotelsModel.fromJson(Map<String, dynamic> json) =>
      SearchHotelsModel(
        status: StatusModel.fromJson(json['status']),
        searchHotelsAllData: SearchHotelsAllDataModel.fromJson(json['data']),
      );
}
