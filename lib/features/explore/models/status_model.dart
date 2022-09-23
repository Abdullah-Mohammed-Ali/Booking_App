class StatusModel {
  String? type;

  StatusModel({
    required this.type,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(type: json['type']);
  }
}
