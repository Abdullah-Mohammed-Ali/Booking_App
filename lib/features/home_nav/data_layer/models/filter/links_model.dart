
import 'package:booking_app/features/home_nav/domain_layer/entities/filter/links_entity.dart';

class LinksModel extends Links {
  const LinksModel({
    required super.label,
    required super.active,
    required super.url,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
    label: json['label'],
    active: json['active'],
    url: json['url'] ?? 'empty',
  );
}
