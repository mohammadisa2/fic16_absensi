import 'dart:convert';

import 'package:fic16_absensi/data/models/response/auth_response_model.dart';

class UserResponseModel {
  final String? message;
  final User? user;

  UserResponseModel({
    this.message,
    this.user,
  });

  factory UserResponseModel.fromJson(String str) =>
      UserResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) =>
      UserResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "user": user?.toMap(),
      };
}
