import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/network/api_constants.dart';
import 'package:booking_app/core/network/error_message_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/facilities/facilities_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/search_hotels/search_hotels_model.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:dio/dio.dart';

abstract class BaseFilterRemoteDataSource {
  Future<FacilitiesModel> getFacilities();
  Future<SearchHotelsModel> getSearchHotels(SearchHotelsParameters parameters);
}

class FilterRemoteDataSource extends BaseFilterRemoteDataSource {
  @override
  Future<FacilitiesModel> getFacilities() async {
    final response = await Dio().get(ApiConstants.facilitiesPath());
    if (response.statusCode == 200) {
      print(response.data);
      return FacilitiesModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<SearchHotelsModel> getSearchHotels(
      SearchHotelsParameters parameters) async {
    final response =
        await Dio().get(ApiConstants.searchHotelsPath(), queryParameters: {
      'name': parameters.name,
      'address': parameters.address,
      'max_price': parameters.maxPrice,
      'min_price': parameters.minPrice,
      'latitude': parameters.lat,
      'longitude': parameters.long,
      'distance': parameters.distance,
      'count': parameters.count,
      'page': parameters.page,
    });

    if (response.statusCode == 200) {
      return SearchHotelsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
