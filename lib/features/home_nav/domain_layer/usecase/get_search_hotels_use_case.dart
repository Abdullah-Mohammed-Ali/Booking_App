import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSearchHotelsUseCase
    extends BaseUseCase<SearchHotels, SearchHotelsParameters> {
  final BaseFilterRepository baseFilterRepository;

  GetSearchHotelsUseCase(this.baseFilterRepository);
  @override
  Future<Either<Failure, SearchHotels>> call(
      SearchHotelsParameters parameters) async {
    return await baseFilterRepository.getSearchHotels(parameters);
  }
}

class SearchHotelsParameters extends Equatable {
  final String? name;
  final String? address;
  final double? maxPrice;
  final double? minPrice;
  //facilities ==> problem
  // final List<Facilities>? facilities;
  final double? lat;
  final double? long;
  final double? distance;
  final int? count;
  final int?page;

  const SearchHotelsParameters({
    this.name,
    this.address,
    this.maxPrice,
    this.minPrice,
    // this.facilities,
    this.lat,
    this.long,
    this.distance,
    this.count,
    this.page,
  });

  @override
  List<Object> get props => [
    name!,
    address!,
    maxPrice!,
    minPrice!,
    // facilities!,
    lat!,
    long!,
    distance!,
    count!,
    page!,
  ];
}
