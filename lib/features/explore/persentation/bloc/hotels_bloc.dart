import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/error/strings.dart';

import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/usecases/create_booking.dart';
import 'package:booking_app/features/booking/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/booking/domain/usecases/update_booking_status.dart';
import 'package:booking_app/features/explore/domain/entities/hotels.dart';
import 'package:booking_app/features/explore/domain/usecases/get_bookings.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsUsecase hotels;

  HotelsBloc({
    required this.hotels,
  }) : super(hotelsInitial()) {
    on<HotelsEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetHotelsEvent) {
        emit(LoadingHotelsState());

        final failureOrPosts = await hotels();

        emit(_mapfailureOrPostsState1(failureOrPosts));
      }
    });
  }
}

HotelsState _mapfailureOrPostsState1(Either<Failure, Hotels> either) {
  return either.fold(
      (failure) => ErrorHotelsState(message: _mapFailureToMessage(failure)),
      (profile_Info_object) => GetHotelsState(hotels: profile_Info_object));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
