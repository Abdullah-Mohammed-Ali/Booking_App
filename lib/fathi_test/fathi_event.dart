part of 'fathi_bloc.dart';

abstract class FathiEvent extends Equatable {
  const FathiEvent();

  @override
  List<Object> get props => [];
}
class GetFacilitiesEvent extends FathiEvent {
  const GetFacilitiesEvent();

  @override
  List<Object> get props => [];
}

class GetSearchHotelsEvent extends FathiEvent {
  final String? name;
  final String? address;
  final double? maxPrice;
  final double? minPrice;
  final double? lat;
  final double? long;
  final double? distance;
  final int? count;
  final int? page;

  const GetSearchHotelsEvent({
    this.name,
    this.address,
    this.maxPrice,
    this.minPrice,
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
        lat!,
        long!,
        distance!,
        count!,
        page!,
      ];
}
