

import 'package:booking_app/features/profile/domain/entities/profile_info.dart';

class Profile_InfoModel extends Profile_Info {

  Profile_InfoModel({required StatusModel  status, required DataModel data})
      : super(status: status , data: data);



  factory Profile_InfoModel.fromJson(Map<String, dynamic> json)=>
      Profile_InfoModel(status: StatusModel.fromJson(json['status']) ,
      data: DataModel.fromJson(json['data'])
      
      );
      
  
  
  // {
  //   status =
  //    StatusModel.fromJson(json['status']) ;
  //   data =
  //   Data.fromJson(json['data']);
  // }


}

class StatusModel extends Status{


  StatusModel({required String type}) :super(type: type);

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(type: json['type']);


// StatusModel.fromJson(Map<String, dynamic> json) {
  //   type = json['type'];
  // }


}


class DataModel extends Data {


  DataModel({
        required int id,
        required String name,
        required String email,
        required Null emailVerifiedAt,
        required String apiToken,
        required String image,
        required String createdAt,
        required String updatedAt,
        required String? googleId,
        required Null provider,
      }):

        super(
    id  : id ,
    name  : name ,
    email  : email,
    emailVerifiedAt  : emailVerifiedAt ,
    apiToken  : apiToken ,
    image  : image ,
    createdAt  : createdAt ,
    updatedAt  : updatedAt ,
    googleId  : googleId ,
    provider  : provider ,
  );



  factory DataModel.fromJson(Map<String, dynamic> json)=>
      DataModel(

          id  : json['id'] ,
          name  : json['name'] ,
          email  : json['email'] ,
          emailVerifiedAt  : json['email_verified_at'] ,
          apiToken  : json['api_token'] ,
          image  : json['image'] ,
          createdAt  : json['created_at'] ,
          updatedAt  : json['updated_at'] ,
          googleId  : json['google_id'] ,
          provider  : json['provider'] ,

      );
      
  
  
  

  // DataModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   emailVerifiedAt = json['email_verified_at'];
  //   apiToken = json['api_token'];
  //   image = json['image'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  //   googleId = json['google_id'];
  //   provider = json['provider'];
  // }


}