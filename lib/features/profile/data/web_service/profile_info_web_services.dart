

import 'dart:convert';
import 'dart:io';

import 'package:booking_app/core/globals.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/entities/update.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWebService {
  late Dio dio;


  ProfileWebService() {
    BaseOptions options = BaseOptions(

      baseUrl: baseUrl,


      headers: {
        'token':  GlobalApiToken

        //"TsxO7n2br7SvbTiWbvmdche0kLzUV0xpjh7vfMES9zJkWBlnCWWcEZ5f3e0R",

      },
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,

    );

    dio = Dio(options);
  }

  Future<Map<String,Map>> getProfileInfo() async {
    print("tokkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkken");
    print(GlobalApiToken);



    try {
      Response response = await dio.get('auth/profile-info');

      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }





  Future<Map<String,Map>> update_Info(Update update ,) async {

    // String name ="Abdullah Mansour" , String email="abdullah.mansour@gmail.com" , String image="Li_logo.png"
    print("hereeeeeeeeeeeeee0");

    String fileName =
        update.imagePath is String? "" :
        update.imagePath.path.split('/').last;



    //print(fileName);
    print("hereeeeeeeeeeeeee1");


    FormData formData = FormData.fromMap({
      "name": update.name ,
      "email": update.email ,
    "image":

    update.imagePath is String? "" :

    await MultipartFile.fromFile(update.imagePath.path, filename:fileName ,)

    });


   // {"name" : "kareem" , "email" : "kareem@gmail.com" , "image": ""}










      // Dio dio = new Dio();
      //
      // dio.post("http://192.168.43.225/api/media", data: data)
      //     .then((response) => print(response))
      //     .catchError((error) => print(error));








    try {
      print("formdataaaaaaaaaaaaaaaaaaaaaaaa");
      //final jsonAllTime = jsonEncode(formData);
      //print(formData.files.first);

     // final jsonAllTime = jsonEncode(formData);

      //print(jsonAllTime);
      print("formdataaaaaaaaaaaaaaaaaaaaaaaa22222");

      Response response = await dio.post(
        'auth/update-info' ,
        data: formData

      );


      print(response.data.toString());
      return Map<String,Map>.from(response.data);
    } catch (e) {
      print(e.toString());
      return {};
    }
  }









  Future<Map<String,Map>> passChangeInfo(Pass pass) async {
    try {
      Response response = await dio.post(
          'auth/pass-change' ,
      data: {"password":pass.password , "password_confirmation":pass.confirmation , "email": pass.mail  },
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