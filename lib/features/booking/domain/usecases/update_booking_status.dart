import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/booking/domain/reposatories/booking_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UpdateBookingUsecase  {

  final BookingRepositoryDomain bookingRepositoryDomain;


  UpdateBookingUsecase(this.bookingRepositoryDomain);

  @override
  Future<Either<Failure, BookingStatus>> call(UpdateBooking updateBooking) async {

    return await bookingRepositoryDomain.update_booking(updateBooking);


  }


}


class UpdateBookingParameters extends Equatable {
  final int? user_id;
  final int? hotel_id;

  UpdateBookingParameters(this.user_id, this.hotel_id);

  @override
  List<Object?> get props => [user_id, hotel_id];
}