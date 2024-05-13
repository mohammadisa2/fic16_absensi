import 'dart:convert';

class UnauthenticatedResponseModel {
  final String message;

  UnauthenticatedResponseModel({
    required this.message,
  });

  UnauthenticatedResponseModel copyWith({
    String? message,
  }) =>
      UnauthenticatedResponseModel(
        message: message ?? this.message,
      );

  factory UnauthenticatedResponseModel.fromJson(String str) =>
      UnauthenticatedResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UnauthenticatedResponseModel.fromMap(Map<String, dynamic> json) =>
      UnauthenticatedResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
