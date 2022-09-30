
class Profile_Info {
  Status status;
  Data data;

  Profile_Info({required  this.status,required   this.data});


}

class Status {
  String type;

  Status({required  this.type});

}




class Data {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String apiToken;
  String image;
  String createdAt;
  String updatedAt;
  String? googleId;
  Null provider;

  Data(
      {
        required  this.id,
        required  this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.apiToken,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.googleId,
        required this.provider});

}