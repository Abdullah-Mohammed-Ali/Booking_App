import 'package:booking_app/features/explore/data/endpoints.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/error/exceptions.dart';

abstract class DioHotel {
  Future<dynamic> get({
    String? endpoint,
    String? url,
    dynamic data,
    dynamic query,
    int? timeout,
  });
}

class DioImplment extends DioHotel {
  final Dio dio = Dio(BaseOptions(
    baseUrl: '$baseUrl$version',
    receiveDataWhenStatusError: true,
    connectTimeout: 10000,
  ));

  @override
  Future<dynamic> get({
    String? endpoint,
    String? url,
    dynamic data,
    dynamic query,
    int? timeout,
  }) async {
    if (timeout != null) {
      dio.options.connectTimeout = timeout;
    }

    // debugPrint('URL => ${dio.options.baseUrl + hotelsendPoint}');
    // debugPrint('Body => $data');

    return await request(
      call: () async => await dio.get(
        endpoint!,
        queryParameters: query,
      ),
    );
  }
}

extension on DioHotel {
  Future request({required Future<Response> Function() call}) async {
    try {
      final r = await call.call();
      // debugPrint('Response => ${r.data}');
      // debugPrint('Response => ${r.statusCode}');
      return r;
    } on DioError catch (e) {
      debugPrint('Error _Message => ${e.message}');
      debugPrint('Error _Error => ${e.error.toString()}');

      throw PrimaryServerException(
        code: 100,
        error: 'error message',
        message: 'error from primary exception',
      );
    }
  }
}
