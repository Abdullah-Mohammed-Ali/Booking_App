// import 'package:bookingapp/features/booking/domain/entities/hotels.dart';
//
// class BookingModel extends Booking {
//
//
//   BookingModel({required StatusModel status,required  DataModel data})
//       : super(status: status , data: data);
//
//
//
//   factory BookingModel.fromJson(Map<String, dynamic> json)=>
//       BookingModel(status: StatusModel.fromJson(json['status']) ,
//           data: DataModel.fromJson(json['data'])
//
//       );
//
// }
//
// class StatusModel extends Status  {
//   StatusModel({required  String type}) :super(type: type );
//
//   factory StatusModel.fromJson(Map<String, dynamic> json) {
//     print("Lastttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
//
//     return StatusModel(type: json['type']);
//   }
//
//
//
// }
//
//
//
// class DataModel extends Data {
//
//
//
//   DataModel(
//       {
//         required int currentPage,
//         required List<DataModel> data,
//         required String firstPageUrl,
//         required int from,
//         required int lastPage,
//         required String lastPageUrl,
//         required List<LinksModel> links,
//         required String nextPageUrl,
//         required String path,
//         required String perPage,
//         required Null prevPageUrl,
//         required int to,
//         required int total,
//
//       }
//       )
//   :super(
//      currentPage:currentPage,
//      data:data,
//      firstPageUrl:firstPageUrl,
//      from:from,
//     lastPage:lastPage,
//      lastPageUrl:lastPageUrl,
//     links:links,
//      nextPageUrl:nextPageUrl,
//      path:path,
//     perPage:perPage,
//     prevPageUrl:prevPageUrl,
//      to:to,
//      total:total,
//   );
//
//
//   factory DataModel.fromJson(Map<String, dynamic> json){
//    List<DataModel> data = <DataModel> [];
//    List<LinksModel> links = <LinksModel>[];
//    print("cureentttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
//    print(json['current_page']);
//
//     return DataModel(
//
//       currentPage: json['current_page'],
//       data: json['data'].forEach((v) {
//         data.add( DataModel.fromJson(v));
//       }),
//
//       firstPageUrl: json['first_page_url'],
//       from: json['from'],
//       lastPage: json['last_page'],
//       lastPageUrl: json['last_page_url'],
//       links: json['links'].forEach((v) {
//         links.add( LinksModel.fromJson(v));
//       }),
//       nextPageUrl: json['next_page_url'],
//       path: json['path'],
//       perPage: json['per_page'],
//       prevPageUrl: json['per_page'],
//       to: json['to'],
//       total: json['total'],
//
//
//     );
//   }
//
//
// }
//
//
// class Data2Model extends Data2 {
//
//
//   Data2Model(
//       {
//
//         required int id ,
//         required String userId,
//         required String hotelId,
//         required String type,
//         required String createdAt,
//         required String updatedAt,
//         required UserModel user,
//         required HotelModel hotel,
//
//
//       }) : super(
//
//      id : id,
//      userId:userId,
//      hotelId:hotelId,
//      type:type ,
//      createdAt:createdAt,
//      updatedAt:updatedAt,
//      user:user,
//      hotel:hotel
//
//   );
//
//   factory Data2Model.fromJson(Map<String, dynamic> json)
//   {
//     return Data2Model(
//
//     id : json['id'],
//     userId : json['user_id'],
//     hotelId : json['hotel_id'],
//     type : json['type'],
//     createdAt : json['created_at'],
//     updatedAt : json['updated_at'],
//     user :   new UserModel.fromJson(json['user']),
//     hotel :  new HotelModel.fromJson(json['hotel'])  ,
//   );
//   }
//
// }
//
// class UserModel extends User {
//
//
//   UserModel(
//       {
//
//
//         required int id,
//        required  String name,
//         required String email,
//         required Null emailVerifiedAt,
//        required  String apiToken,
//        required  String image,
//         required String createdAt,
//        required  String updatedAt,
//        required  String googleId,
//         required Null provider,
//       }) :  super(
//
//       id: id,
//       name:name,
//        email:email,
//       emailVerifiedAt:emailVerifiedAt,
//   apiToken:apiToken,
//    image:image,
//        createdAt:createdAt,
//        updatedAt:updatedAt,
//        googleId:googleId,
//        provider:provider,
//
//
//
//   );
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//
//      id : json['id'],
//     name : json['name'],
//     email : json['email'],
//     emailVerifiedAt : json['email_verified_at'],
//     apiToken : json['api_token'],
//     image : json['image'],
//     createdAt : json['created_at'],
//     updatedAt : json['updated_at'],
//     googleId : json['google_id'],
//     provider : json['provider'],
//     );
//   }
//
// }
//
// class HotelModel extends Hotel {
//
//
//   HotelModel(
//       {
//
//         required int id,
//         required String name,
//         required String description,
//         required String price,
//         required String address,
//         required String longitude,
//         required String latitude,
//         required String rate,
//         required String createdAt,
//         required String updatedAt,
//         required List<HotelImagesModel> hotelImages,
//         required List<FacilitiesModel> facilities,
//
//
//       }) :super(
//
//       id:id,
//       name:name,
//       description:description,
//       price:price,
//       address:address,
//       longitude:longitude,
//       latitude:latitude,
//       rate:rate,
//       createdAt:createdAt,
//       updatedAt:updatedAt,
//      hotelImages:hotelImages,
//       facilities:facilities
//
//
//   );
//
//   factory HotelModel.fromJson(Map<String, dynamic> json) {
//     List  <HotelImagesModel> hotelImages= [];
//     List <FacilitiesModel>facilities= [];
//
//     json['hotel_images'].forEach((v) {
//       hotelImages.add( HotelImagesModel.fromJson(v));
//     });
//
//     json['facilities'].forEach((v) {
//       facilities.add( FacilitiesModel.fromJson(v));
//     });
//     print("hotelllllllllllllllllllllllllllll");
//
//     return HotelModel(
//     id : json['id'],
//     name : json['name'],
//     description : json['description'],
//     price : json['price'],
//     address : json['address'],
//     longitude : json['longitude'],
//     latitude : json['latitude'],
//     rate : json['rate'],
//     createdAt : json['created_at'],
//     updatedAt : json['updated_at'],
//
//       hotelImages : hotelImages,
//
//
//
//
//
//       facilities :facilities
//
//
//
//     );
//   }
//
// }
//
// class HotelImagesModel extends HotelImages {
//
//   HotelImagesModel(
//       {
//         required int id,
//         required String hotelId,
//         required String image,
//         required Null createdAt,
//         required Null updatedAt
//       }) :super(
//
//     id: id,
//     image: image,
//     createdAt: createdAt,
//     hotelId: hotelId,
//     updatedAt: updatedAt,
//
//
//   );
//
//   factory HotelImagesModel.fromJson(Map<String, dynamic> json)=>HotelImagesModel(
//
//       id : json['id'],
//       hotelId : json['hotel_id'],
//       image : json['image'],
//   createdAt : json['created_at'],
//   updatedAt : json['updated_at'],
//
//
//   );
//
//
//
// }
//
// class FacilitiesModel extends Facilities {
//
//   FacilitiesModel({
//
//
//     required int id,
//     required String name,
//     required String image,
//     required String createdAt,
//     required String updatedAt
//   }) : super(
//
//       id: id,
//     createdAt: createdAt,
//     image: image,
//       name: name ,
//       updatedAt: updatedAt,
//
//
//
//   );
//
//   factory FacilitiesModel.fromJson(Map<String, dynamic> json)=> FacilitiesModel(
//
//       id : json['id'],
//       name : json['name'],
//       image : json['image'],
//   createdAt : json['created_at'],
//   updatedAt : json['updated_at'],
//
//   );
//
//
//
//
//
// }
//
// class LinksModel extends Links {
//
//
//   LinksModel({required String url, required String label, required bool active})
//   :super(active: active, label: label,url: url);
//
//   factory LinksModel.fromJson(Map<String, dynamic> json)=>
//       LinksModel(
//           url : json['url'],
//           label : json['label'],
//           active : json['active'],
//
//       );
//
//
//
// }