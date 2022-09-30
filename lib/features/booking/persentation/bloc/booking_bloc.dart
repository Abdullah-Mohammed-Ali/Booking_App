import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/error/strings.dart';

import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/booking/domain/usecases/create_booking.dart';
import 'package:booking_app/features/booking/domain/usecases/get_bookings.dart';
import 'package:booking_app/features/booking/domain/usecases/update_booking_status.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';





part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final GetBookingUsecase booking;
  final UpdateBookingUsecase bookingStatus;
  final CreateBookingUsecase bookingStatus2;

  BookingBloc({


  required this.booking,
  required this.bookingStatus,
  required this.bookingStatus2})
      : super(bookingInitial()) {
    on<BookingEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is GetBookingEvent) {
        emit(LoadingBookingState());

        final failureOrPosts = await booking(event.getBooking);


        emit(_mapfailureOrPostsState1(failureOrPosts));

      }


      else if (event is UpdateBookingEvent) {
        emit(LoadingBookingState());

        final failureOrPosts = await bookingStatus(event.updateBooking);


        emit(_mapfailureOrPostsState2(failureOrPosts));








      }

      else if (event is CreateBookingEvent) {
        emit(LoadingBookingState());

        final failureOrPosts = await bookingStatus2(event.createBooking);


        emit(_mapfailureOrPostsState3(failureOrPosts));
      }
      
      
      
      
    });
  }
}










BookingState _mapfailureOrPostsState1(Either<Failure, Booking> either) {
  return either.fold(
          (failure) => ErrorBookingState(message: _mapFailureToMessage(failure)),
          (profile_Info_object) => GetBookingState(booking: profile_Info_object));
}

BookingState _mapfailureOrPostsState2(Either<Failure, BookingStatus> either) {
  return either.fold(
          (failure) => ErrorBookingState(message: _mapFailureToMessage(failure)),
          (passChange_object) => UpdateBookingState(bookingStatus: passChange_object));
}


BookingState _mapfailureOrPostsState3(Either<Failure, BookingStatus> either) {
  return either.fold(
          (failure) => ErrorBookingState(message: _mapFailureToMessage(failure)),
          (update_info_object) => CreateBookingState(bookingStatus:  update_info_object));
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