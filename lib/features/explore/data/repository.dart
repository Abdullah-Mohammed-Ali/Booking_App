import 'package:booking_app/features/explore/data/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';
import '../models/hotels_model.dart';
import 'dio_helper.dart';

abstract class Repository {
  Future<Either<PrimaryServerException, HotelsModel>> getHotels({
    required int page,
  });
}

class RepositoryImplementation extends Repository {
  final DioHotel dioHotel;
  RepositoryImplementation({required this.dioHotel});

  @override
  Future<Either<PrimaryServerException, HotelsModel>> getHotels({
    required int page,
  }) async {
    return basicErrorHanding<HotelsModel>(
      onSuccess: () async {
        final response = await dioHotel.get(
          endpoint: hotelsendPoint,
          query: {
            'page': page,
            'count': 10,
          },
        );
        // print(response);
        return HotelsModel.fromJson(response.data);
      },
      onPrimaryServer: (e) async {
        return e;
      },
    );
  }
}

extension on Repository {
  Future<Either<PrimaryServerException, T>> basicErrorHanding<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception)?
        onPrimaryServer,
    Future<PrimaryServerException> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s) {
      debugPrint(s.toString());
      return Left(e);
    }
  }
}
