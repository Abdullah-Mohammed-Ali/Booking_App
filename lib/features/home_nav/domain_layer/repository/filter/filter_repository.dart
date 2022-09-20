import 'package:booking_app/core/error/exceptions.dart';
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:booking_app/features/home_nav/data_layer/datasource/remote_data_source/filter/remote_data_source.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:dartz/dartz.dart';

class FilterRepository extends BaseFilterRepository{
  final BaseFilterRemoteDataSource baseFilterRemoteDataSource;

  FilterRepository(this.baseFilterRemoteDataSource);

  @override
  Future<Either<Failure, Facilities>> getFacilities(NoParameters parameters) async{
    final result = await baseFilterRemoteDataSource.getFacilities();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.error.message));
    }
  }

  @override
  Future<Either<Failure, SearchHotels>> getSearchHotels(SearchHotelsParameters parameters) async{
    final result = await baseFilterRemoteDataSource.getSearchHotels(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.error.message));
    }
  }

}