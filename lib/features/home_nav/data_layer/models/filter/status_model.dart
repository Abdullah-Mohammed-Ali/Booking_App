import 'package:booking_app/features/home_nav/domain_layer/entities/filter/status_entity.dart';

class StatusModel extends Status {
  const StatusModel({
    required super.type,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
    type: json['type'] ?? 0,
  );
}
