import 'dart:convert';

import 'package:booking_app/core/error/failure.dart';

import 'package:booking_app/features/booking/data/datasources/booking_web_services.dart';
import 'package:booking_app/features/booking/data/models/bookingModel.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/booking/domain/reposatories/booking_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/entities/booking.dart';

class BookingRepository implements BookingRepositoryDomain {
  final BookingWebService bookingWebService;
  final NetworkInfo networkInfo;

  BookingRepository(
      {required this.bookingWebService, required this.networkInfo});

  @override
  Future<Either<Failure, Booking>> get_booking(GetBooking getBooking) async {
    final info = await bookingWebService.getBookings(getBooking);
    return Right(Booking.fromJson(info));
  }

  @override
  Future<Either<Failure, BookingStatus>> create_booking(
      CreateBooking createBooking) async {
    final info = await bookingWebService.create_booking(createBooking);
    return Right(BookingStatus.fromJson(info));
  }

  @override
  Future<Either<Failure, BookingStatus>> update_booking(
      UpdateBooking updateBooking) async {
    final info = await bookingWebService.update_booking_status(updateBooking);
    return Right(BookingStatus.fromJson(info));
  }
}
