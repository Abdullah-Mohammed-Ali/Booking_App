

import 'package:booking_app/features/booking/domain/entities/booking_status.dart';

class BookingStatusModel extends BookingStatus {


  BookingStatusModel({required StatusModel status})
      : super(status: status );

  factory BookingStatusModel.fromJson(Map<String, dynamic> json)=>
      BookingStatusModel(status: StatusModel.fromJson(json['status']));

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
