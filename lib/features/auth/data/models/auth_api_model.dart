import 'package:lost_n_found/features/auth/domain/entities/auth_entity.dart';
import 'package:lost_n_found/features/batch/data/models/batch_api_model.dart';

class AuthApiModel {
  final String? id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String username;
  final String? password;
  final String? batchId;
  final String? profilePicture;
  final BatchApiModel? batch;

  AuthApiModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.username,
    this.phoneNumber,
    this.password,
    this.batchId,
    this.profilePicture,
    this.batch,
  });

  //toJSON
  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'username': username,
      'password': password,
      'batchId': batchId,
      'profilePicture': profilePicture,
    };
  }

  //fromJSON
  factory AuthApiModel.fromJson(Map<String, dynamic> json) {
    return AuthApiModel(
      id: json['id'],
      fullName: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      username: json['username'],
      batchId: json['batchId'],
      profilePicture: json['profilePicture'],
      batch: json['batch'] != null
          ? BatchApiModel.fromJson(json['batch'])
          : null,
    );
  }

  //toEntity
  AuthEntity toEntity() {
    return AuthEntity(
      authId: id,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      batchId: batchId,
      username: username,
      profilePicture: profilePicture,
      batch: batch?.toEntity(),
    );
  }

  //fromEntity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.authId,
      fullName: entity.fullName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      batchId: entity.batchId,
      username: entity.username,
      password: entity.password,
      profilePicture: entity.profilePicture,
      batch: entity.batch != null
          ? BatchApiModel.fromEntity(entity.batch!)
          : null,
    );
  }

  //toEntityList
  static List<AuthEntity> toEntityList(List<AuthApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }
}
