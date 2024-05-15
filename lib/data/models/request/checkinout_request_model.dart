import 'dart:convert';

class CheckInOutRequestModel {
  final String? latitude;
  final String? longitude;
  final int? companyId;

  CheckInOutRequestModel({
    this.latitude,
    this.longitude,
    this.companyId,
  });

  factory CheckInOutRequestModel.fromJson(String str) =>
      CheckInOutRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckInOutRequestModel.fromMap(Map<String, dynamic> json) =>
      CheckInOutRequestModel(
        latitude: json["latitude"],
        longitude: json["longitude"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "company_id": companyId,
      };
}
