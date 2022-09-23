
import '../../home_nav/data_layer/models/filter/status_model.dart';
import 'hotel_model.dart';

class HotelsModel {
  final StatusModel status;
  final HotelsDataModel? data;

  HotelsModel({
    required this.status,
    required this.data,
  });

  factory HotelsModel.fromJson(Map<String, dynamic> json) {
    return HotelsModel(
      status: StatusModel.fromJson(json['status']),
      data: HotelsDataModel.fromjson(json['data']),
    );
  }
}

class HotelsDataModel {
  final List<HotelModel> data;

  HotelsDataModel({
    required this.data,
  });

  factory HotelsDataModel.fromjson(Map<String, dynamic> json) {
    return HotelsDataModel(
      data: List<HotelModel>.from(
        json['data'].map(
          (x) => HotelModel.fromJson(x),
        ),
      ),
    );
  }
}
