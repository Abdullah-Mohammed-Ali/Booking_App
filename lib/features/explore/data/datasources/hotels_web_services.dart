

import 'dart:convert';

import 'package:booking_app/core/globals.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HotelsWebService {
  late Dio dio;

  HotelsWebService() {
    BaseOptions options = BaseOptions(

      baseUrl: baseUrl,


      headers: {
        'token':  GlobalApiToken


        //"z4miu7xCRSrsw7r7za2ioTdnQCzEN24WpanWiMTpqNKN7iiOVke0iHTfho64",

      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,

    );

    dio = Dio(options);
  }

  Future<Map<String,Map>> getHotels() async {
    try {
      Response response = await dio.get('hotels' ,
          queryParameters: {'count': 10, 'page':  1 });

      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }







}