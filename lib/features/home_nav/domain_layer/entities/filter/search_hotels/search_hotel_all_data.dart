import 'package:booking_app/features/home_nav/domain_layer/entities/filter/links_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_data_entity.dart';
import 'package:equatable/equatable.dart';

class SearchHotelsAllData extends Equatable {
  final int currentPage;
  final List<SearchHotelsData> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;

  final List<Links> links;
  final String nextPageUrl;
  final String path;
  final String perPage;
  final String prevPageUrl;
  final int to;
  final int total;

  const SearchHotelsAllData({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  @override
  List<Object> get props =>
      [
        currentPage,
        data,
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        links,
        nextPageUrl,
        path,
        perPage,
        to,
        total,
      ];
}