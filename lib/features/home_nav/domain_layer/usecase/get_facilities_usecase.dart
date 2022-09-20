
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/repository/filter/base_filter_repository.dart';
import 'package:dartz/dartz.dart';

class GetFacilitiesUseCase extends BaseUseCase<Facilities, NoParameters> {
  final BaseFilterRepository baseFilterRepository;

  GetFacilitiesUseCase(this.baseFilterRepository);
  @override
  Future<Either<Failure, Facilities>> call(NoParameters parameters) async{
    return await baseFilterRepository.getFacilities(parameters);
  }

}