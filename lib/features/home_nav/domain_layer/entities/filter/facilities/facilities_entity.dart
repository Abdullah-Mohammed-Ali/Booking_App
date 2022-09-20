import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_data_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/status_entity.dart';
import 'package:equatable/equatable.dart';

class Facilities extends Equatable {
  final Status status;
  final List<FacilitiesData> facilitiesData;

  const Facilities({
    required this.status,
    required this.facilitiesData,
  });

  @override
  List<Object> get props => [status, facilitiesData];
}
