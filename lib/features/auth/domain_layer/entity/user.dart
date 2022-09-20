import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? emailVerifiedAt;
  final String? apiToken;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final String? googleId;
  final String? provider;

  const UserEntity(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.apiToken,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.googleId,
      this.provider});

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        apiToken,
        image,
        createdAt,
        updatedAt,
        googleId,
        provider
      ];
}
