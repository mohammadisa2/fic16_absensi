import 'dart:convert';

class CheckInOutResponseModel {
  final String? message;
  final Attendance? attendance;

  CheckInOutResponseModel({
    this.message,
    this.attendance,
  });

  factory CheckInOutResponseModel.fromJson(String str) =>
      CheckInOutResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckInOutResponseModel.fromMap(Map<String, dynamic> json) =>
      CheckInOutResponseModel(
        message: json["message"],
        attendance: json["attendance"] == null
            ? null
            : Attendance.fromMap(json["attendance"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "attendance": attendance?.toMap(),
      };
}

class Attendance {
  final int? id;
  final int? userId;
  final int? companyId;
  final DateTime? date;
  final String? timeIn;
  final String? timeOut;
  final String? latlonIn;
  final String? latlonOut;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Attendance({
    this.id,
    this.userId,
    this.companyId,
    this.date,
    this.timeIn,
    this.timeOut,
    this.latlonIn,
    this.latlonOut,
    this.createdAt,
    this.updatedAt,
  });

  factory Attendance.fromJson(String str) =>
      Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        userId: json["user_id"],
        companyId: json["company_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timeIn: json["time_in"],
        timeOut: json["time_out"],
        latlonIn: json["latlon_in"],
        latlonOut: json["latlon_out"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "company_id": companyId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time_in": timeIn,
        "time_out": timeOut,
        "latlon_in": latlonIn,
        "latlon_out": latlonOut,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
