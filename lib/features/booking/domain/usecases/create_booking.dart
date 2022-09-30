import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/reposatories/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CreateBookingUsecase  {
  final BookingRepositoryDomain bookingRepositoryDomain;

  CreateBookingUsecase(this.bookingRepositoryDomain);


  @override
  Future<Either<Failure, BookingStatus>>call(CreateBooking createBooking) async {

    return await bookingRepositoryDomain.create_booking(createBooking);


  }


}


class CreateBookingParameters extends Equatable {
  final int? booking_id;

  CreateBookingParameters(this.booking_id);

  @override
  List<Object?> get props => [booking_id];

}