import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/reposatories/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBookingUsecase  {
  final BookingRepositoryDomain bookingRepositoryDomain;

  GetBookingUsecase(this.bookingRepositoryDomain);


  @override
  Future<Either<Failure, Booking>> call(GetBooking getBooking) async {
    return await bookingRepositoryDomain.get_booking(getBooking);


  }


}


class GetBookingParameters extends Equatable {
  final String? type;
  final int? count;

  GetBookingParameters({this.type, this.count});

  @override
  List<Object?> get props => [type, count];


}