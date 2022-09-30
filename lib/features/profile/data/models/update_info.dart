
import 'package:booking_app/features/profile/domain/entities/update_info.dart';

class update_infoModel extends update_info {


  update_infoModel({required StatusModel status})
      : super(status: status );

  factory update_infoModel.fromJson(Map<String, dynamic> json)=>
      update_infoModel(

          status:

          StatusModel.fromJson(json['status'])
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
