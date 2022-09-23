import 'dart:async';

import 'package:booking_app/core/usecase/base_use_case.dart';
import 'package:booking_app/core/utils/enum.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_data_entity.dart';

import 'package:booking_app/features/home_nav/domain_layer/entities/filter/facilities/facilities_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/links_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotel_all_data.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_data_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/search_hotels/search_hotels_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/status_entity.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_facilities_usecase.dart';
import 'package:booking_app/features/home_nav/domain_layer/usecase/get_search_hotels_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/home_nav/domain_layer/entities/filter/hotel_images_entity.dart';

part 'fathi_event.dart';

part 'fathi_state.dart';

class FathiBloc extends Bloc<FathiEvent, FathiState> {
  GetFacilitiesUseCase getFacilitiesUseCase;
  GetSearchHotelsUseCase getSearchHotelsUseCase;

  FathiBloc(this.getFacilitiesUseCase, this.getSearchHotelsUseCase)
      : super(const FathiState()) {
    on<GetFacilitiesEvent>(_getFacilities);
    on<GetSearchHotelsEvent>(_getSearchHotels);
  }

  FutureOr<void> _getFacilities(
      GetFacilitiesEvent event, Emitter<FathiState> emit) async{
    final result = await getFacilitiesUseCase(const NoParameters());
    result.fold(
          (l) => emit(state.copyWith(
        facilitiesState: RequestState.error,
        facilitiesMessage: l.message,
      )),
          (r) => emit(
          state.copyWith(facilities: r, facilitiesState: RequestState.loaded)),
    );
  }

  FutureOr<void> _getSearchHotels(
      GetSearchHotelsEvent event, Emitter<FathiState> emit) async{
    final result = await getSearchHotelsUseCase(SearchHotelsParameters(
      name: event.name,
      address: event.address,
      maxPrice: event.maxPrice,
      minPrice: event.minPrice,
      lat: event.lat,
      long: event.long,
      distance: event.distance,
      count: event.count,
      page: event.page,
    ));
    result.fold(
          (l) => emit(state.copyWith(
        searchHotelsState: RequestState.error,
        searchHotelsMessage: l.message,
      )),
          (r) => emit(state.copyWith(searchHotels: r, searchHotelsState: RequestState.loaded)),
    );
  }
}
