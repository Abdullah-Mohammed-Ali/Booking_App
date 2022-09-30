
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/explore/domain/entities/hotels.dart';
import 'package:booking_app/features/explore/domain/reposatories/hotels_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetHotelsUsecase  {
  final HotelsRepositoryDomain hotelsRepositoryDomain;

  GetHotelsUsecase(this.hotelsRepositoryDomain);


  @override
  Future<Either<Failure, Hotels>> call() async {
    return await hotelsRepositoryDomain.get_hotels();


  }


}


