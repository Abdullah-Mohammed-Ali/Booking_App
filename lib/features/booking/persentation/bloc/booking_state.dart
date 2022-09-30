part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();
}

class bookingInitial extends BookingState {

  @override
  List<Object> get props => [];
}


class LoadingBookingState extends BookingState{




  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoadingBookingState2 extends BookingState{




  @override
  // TODO: implement props
  List<Object?> get props => [];
}






class GetBookingState extends BookingState{
  final Booking booking;

  GetBookingState({required this.booking});

  @override
  // TODO: implement props
  List<Object?> get props => [booking];


}

class UpdateBookingState extends BookingState{
  final BookingStatus bookingStatus;

  UpdateBookingState({required this.bookingStatus});

  @override
  // TODO: implement props
  List<Object?> get props => [bookingStatus];


}

class CreateBookingState extends BookingState{
  final BookingStatus  bookingStatus;

  CreateBookingState({required this.bookingStatus});

  @override
  // TODO: implement props
  List<Object?> get props => [bookingStatus];


}




class ErrorBookingState extends BookingState{
  final String message;

  ErrorBookingState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}
class MessageBookingState extends BookingState{
  final String message;

  MessageBookingState({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];


}