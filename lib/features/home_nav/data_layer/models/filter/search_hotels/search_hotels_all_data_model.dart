
import 'package:booking_app/features/home_nav/data_layer/models/filter/links_model.dart';
import 'package:booking_app/features/home_nav/data_layer/models/filter/search_hotels/search_hotels_data_model.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotel_all_data.dart';

class SearchHotelsAllDataModel extends SearchHotelsAllData {
  const SearchHotelsAllDataModel({
    required super.currentPage,
    required super.data,
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.links,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });

  factory SearchHotelsAllDataModel.fromJson(Map<String, dynamic> json) =>
      SearchHotelsAllDataModel(
        currentPage: json['current_page'],
        data: List<SearchHotelsDataModel>.from(json['data'].map((e)=>SearchHotelsDataModel.fromJson(e))),
        firstPageUrl: json['first_page_url'] ?? 'empty',
        from: json['from'] ?? 0,
        lastPage: json['last_page'] ?? 0,
        lastPageUrl: json['last_page_url'] ?? 'empty',
        links: List<LinksModel>.from(json['links'].map((e)=>LinksModel.fromJson(e))),
        nextPageUrl: json['next_page_url'] ?? 'empty',
        path: json['path'] ?? 'empty',
        perPage: json['per_page'].toString(),
        prevPageUrl: json['prev_page_url'] ?? 'empty',
        to: json['to'] ?? 0,
        total: json['total'] ?? 0,
      );
}
