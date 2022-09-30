import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/core/network/network_info.dart';
import 'package:booking_app/features/explore/data/datasources/hotels_web_services.dart';
import 'package:booking_app/features/explore/domain/entities/hotels.dart';
import 'package:booking_app/features/explore/domain/reposatories/hotels_repository.dart';

import 'package:dartz/dartz.dart';

class HotelsRepository implements HotelsRepositoryDomain {
  final HotelsWebService hotelWebService;
  final NetworkInfo networkInfo;

  HotelsRepository({required this.hotelWebService, required this.networkInfo});

  @override
  Future<Either<Failure, Hotels>> get_hotels() async {
    final info = await hotelWebService.getHotels();
    return Right(Hotels.fromJson(info));
  }
}
