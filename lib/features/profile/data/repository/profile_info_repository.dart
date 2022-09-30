import 'dart:convert';

import 'package:booking_app/core/Network/network_info.dart';
import 'package:booking_app/core/error/failure.dart';
import 'package:booking_app/features/profile/data/models/pass_change_model.dart';
import 'package:booking_app/features/profile/data/models/profile_info.dart';
import 'package:booking_app/features/profile/data/models/update_info.dart';
import 'package:booking_app/features/profile/data/web_service/profile_info_web_services.dart';
import 'package:booking_app/features/profile/domain/entities/pass.dart';
import 'package:booking_app/features/profile/domain/entities/update.dart';
import 'package:booking_app/features/profile/domain/reposatories/profiles_info_repository.dart';

import 'package:dartz/dartz.dart';


class ProfileRepository implements ProfileRepositoryDomain {
final ProfileWebService profileWebService;
final NetworkInfo networkInfo;


ProfileRepository({required this.profileWebService , required this.networkInfo});

  @override
  Future<Either<Failure,Profile_InfoModel>> ProfileInfo() async {

    final info = await profileWebService.getProfileInfo();
    return Right(Profile_InfoModel.fromJson(info)) ;

}


@override
  Future<Either<Failure , PassChangeModel>> passChange(Pass pass) async {
  final ProfileWebService profileWebService=ProfileWebService();

  final info = await profileWebService.passChangeInfo(pass);
  return Right(PassChangeModel.fromJson(info)) ;
}


@override
  Future<Either<Failure , update_infoModel>>  updateInfo(Update update) async {
  final ProfileWebService profileWebService=ProfileWebService();


  //const Update update=Update(name : "Abdullah Mansour" , email: "abdullah.mansour@gmail.com" ,  imagePath : "Li_logo.png");


  final info = await profileWebService.update_Info(update);
  return Right(update_infoModel.fromJson(info)) ;
}






}




// class ProfileRepository {
// //final ProfileWebService profileWebService;
//
// //ProfileRepository(this.profileWebService);
//
//   Future<Either<Failure, Profile_Info>> ProfileInfo() async {
//     final ProfileWebService profileWebService=ProfileWebService();
//     final info = await profileWebService.getProfileInfo();
//     return Right(Profile_Info.fromJson(info)) ;
//   }
//
//
//   Future<Either<Failure, Pass_Change>>  passChange() async {
//     final ProfileWebService profileWebService=ProfileWebService();
//
//     final info = await profileWebService.passChangeInfo();
//     return Right(Pass_Change.fromJson(info)) ;
//   }
//
//
//   Future<Either<Failure, update_info>> updateInfo() async {
//     final ProfileWebService profileWebService=ProfileWebService();
//
//     final info = await profileWebService.update_Info();
//     return Right(update_info.fromJson(info)) ;
//   }
//
//
//
//
//
//
// }
