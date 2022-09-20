import '../../domain_layer/entity/user.dart';

class AuthUserModel extends AuthUserEntity {
  const AuthUserModel({
    required super.id,
    required super.name,
    super.image,
    required super.apiToken,
    required super.email,
    super.emailVerifiedAt,
    super.googleId,
    super.updatedAt,
    super.createdAt,
    super.provider,
  });
  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        apiToken: json['api_token'],
        image: json['image'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        googleId: json['google_id'],
        provider: json['provider'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['api_token'] = apiToken;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['google_id'] = googleId;
    data['provider'] = provider;
    return data;
  }
}
