part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class GetBookingEvent extends BookingEvent {
  final GetBooking getBooking;

  GetBookingEvent({required this.getBooking});

  @override
  List<Object> get props => [getBooking];
}

class UpdateBookingEvent extends BookingEvent {
  final UpdateBooking updateBooking;

  UpdateBookingEvent({required this.updateBooking});

  @override
  List<Object> get props => [updateBooking];
}

class CreateBookingEvent extends BookingEvent {
  final CreateBooking createBooking;

  CreateBookingEvent({required this.createBooking});

  @override
  List<Object> get props => [createBooking];

}