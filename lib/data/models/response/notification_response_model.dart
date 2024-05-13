import 'dart:convert';

class NotificationResponseModel {
  List<Broadcast>? broadcasts;

  NotificationResponseModel({
    this.broadcasts,
  });

  factory NotificationResponseModel.fromJson(String str) =>
      NotificationResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationResponseModel.fromMap(Map<String, dynamic> json) =>
      NotificationResponseModel(
        broadcasts: json["broadcasts"] == null
            ? []
            : List<Broadcast>.from(
                json["broadcasts"]!.map((x) => Broadcast.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "broadcasts": broadcasts == null
            ? []
            : List<dynamic>.from(broadcasts!.map((x) => x.toMap())),
      };
}

class Broadcast {
  int? id;
  String? title;
  String? message;
  DateTime? lastSendNotification;
  DateTime? createdAt;
  DateTime? updatedAt;

  Broadcast({
    this.id,
    this.title,
    this.message,
    this.lastSendNotification,
    this.createdAt,
    this.updatedAt,
  });

  factory Broadcast.fromJson(String str) => Broadcast.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Broadcast.fromMap(Map<String, dynamic> json) => Broadcast(
        id: json["id"],
        title: json["title"],
        message: json["message"],
        lastSendNotification: json["last_send_notification"] == null
            ? null
            : DateTime.parse(json["last_send_notification"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "message": message,
        "last_send_notification": lastSendNotification?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
