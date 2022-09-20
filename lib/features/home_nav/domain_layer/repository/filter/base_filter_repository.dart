import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class BaseFilterRepository{
  Future <Either<Failure, Facilities>> getFacilities(NoParameters parameters);
  Future <Either<Failure, SearchHotels>> getSearchHotels(SearchHotelsParameters parameters);
}