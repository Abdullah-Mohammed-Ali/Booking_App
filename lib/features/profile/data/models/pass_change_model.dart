
import 'package:booking_app/features/profile/domain/entities/pass_change.dart';

class PassChangeModel extends PassChange {


  PassChangeModel({required StatusModel status,  DataModel? data})
      : super(status: status , data: data);



  factory PassChangeModel.fromJson(Map<String, dynamic> json)=>
      PassChangeModel(

          status: StatusModel.fromJson(json['status']) ,
          data:

          json['data'] != null ? DataModel.fromJson(json['data'])
              :null

      );







}

class StatusModel extends Status {


  StatusModel({required  String type, required TitleModel title}) :super(type: type ,title:title);

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(type: json['type'] ,

      title:TitleModel.fromJson(json['title'] )
  );








}

class TitleModel  extends Title2{


  TitleModel({ required String en,  required String ar}) :super(en:en ,ar:ar);

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(en : json['en'] , ar : json['ar'] );




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
    required Null googleId,
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