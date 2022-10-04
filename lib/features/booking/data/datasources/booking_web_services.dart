

import 'dart:convert';

import 'package:booking_app/core/globals.dart';
import 'package:booking_app/features/booking/domain/entities/create_booking.dart';
import 'package:booking_app/features/booking/domain/entities/getBooking.dart';
import 'package:booking_app/features/booking/domain/entities/updateBooking.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class BookingWebService {
  late Dio dio;

  BookingWebService() {
    BaseOptions options = BaseOptions(

      baseUrl: baseUrl,


      headers: {
        'token':  GlobalApiToken


        //"JSsf0q50iWSVkxwnLeDqPCwBqayyVjByv0gwVMTcvnZfiJuuAkyc2YKFU9ex",

      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,

    );

    dio = Dio(options);
  }

  Future<Map<String,Map>> getBookings(GetBooking getBooking) async {
    try {
      Response response = await dio.get('get-bookings' ,
          queryParameters: {'count': getBooking.count, 'type': getBooking.upcoming});

      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }



  Future<Map<String,Map>> update_booking_status(UpdateBooking updateBooking ) async {
    try {
      Response response = await dio.post(
        'update-booking-status' ,
        data: {"booking_id": updateBooking.bookinId , "type": updateBooking.type },
      );


      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }






  Future<Map<String,Map>> create_booking(CreateBooking createBooking) async {
    try {
      Response response = await dio.post(
        'create-booking' ,
        data: {

          //"user_id":createBooking.userId ,

          "hotel_id": createBooking.hoteId
        },
      );


      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }













  Future<PassChangeModel?> changePassword({required PassChangeModel passChange}) async {
    PassChangeModel? changedPass;

    try {
      Response response = await dio.post(
        'auth/pass-change',
        data: passChange.toJson(),
      );



      print('User created: ${response.data}');

      changedPass = PassChangeModel.fromJson(response.data);
      //print(changedPass );
      //1print("kimooooooooooooooooo");
    } catch (e) {
      print('Error creating user: $e');
    }
    return changedPass;
  }
  Future<PassChangeModel?> changePassword1({required PassChangeModel passChange}) async {
    PassChangeModel? changedPass;

    try {
      Response response = await dio.post(
        'auth/pass-change',
        data: passChange.toJson(),
      );

      print('User created: ${response.data}');

      changedPass = PassChangeModel.fromJson(response.data);
      print(changedPass );
      print("kimooooooooooooooooo");

    } catch (e) {
      print('Error creating user: $e');
    }
    return changedPass;
  }



}