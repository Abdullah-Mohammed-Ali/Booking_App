
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:dartz/dartz.dart';

abstract class BookingRepositoryDomain{
  Future<Either<Failure , Booking>> get_booking(GetBooking getBooking) ;
  Future<Either<Failure , BookingStatus>>   update_booking(UpdateBooking updateBooking); // unit means nothing
  Future<Either<Failure , BookingStatus>> create_booking(CreateBooking createBooking);

}