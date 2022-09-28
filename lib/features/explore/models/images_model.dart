class HotelsImagesModel {
  final String id;
  final String hotelId;
  final String image;

  HotelsImagesModel({
    required this.id,
    required this.hotelId,
    required this.image,
  });

  factory HotelsImagesModel.fromJson(Map<String, dynamic> json) {
    return HotelsImagesModel(
      id: json['id'],
      hotelId: json['hotel_id'],
      image: json['image'],
    );
  }
}
