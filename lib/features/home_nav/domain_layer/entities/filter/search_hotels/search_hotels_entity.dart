import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotel_all_data.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/status_entity.dart';
import 'package:equatable/equatable.dart';

class SearchHotels extends Equatable {
  final Status status;
  final SearchHotelsAllData searchHotelsAllData;

  const SearchHotels({
    required this.status,
    required this.searchHotelsAllData,
  });

  @override
  List<Object> get props => [
    status,
    searchHotelsAllData,
  ];
}
