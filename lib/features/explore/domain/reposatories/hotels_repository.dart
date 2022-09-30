
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/booking/domain/entities/booking.dart';
import 'package:booking_app/features/booking/domain/entities/booking_status.dart';
import 'package:booking_app/features/explore/domain/entities/hotels.dart';
import 'package:dartz/dartz.dart';

abstract class HotelsRepositoryDomain{
  Future<Either<Failure , Hotels>> get_hotels() ;


}