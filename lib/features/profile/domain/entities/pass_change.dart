class PassChange {
  Status status;
  Data ?data;

  PassChange({required  this.status, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }


}



class Status {
  String type;
  Title2 title;

  Status({required  this.type, required  this.title});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    return data;
  }



}




class Title2 {
  String en;
  String ar;

  Title2({required  this.en,required  this.ar});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }

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
  Null googleId;
  Null provider;

  Data(
      {

        required  this.id,
        required  this.name,
        required  this.email,
        required  this.emailVerifiedAt,
        required  this.apiToken,
        required  this.image,
        required  this.createdAt,
        required  this.updatedAt,
        required  this.googleId,
        required  this.provider
      });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['google_id'] = this.googleId;
    data['provider'] = this.provider;
    return data;
  }


}
