import 'dart:convert';

class AuthResponseModel {
  User? user;
  String? token;
  Company? company;

  AuthResponseModel({
    this.user,
    this.token,
    this.company,
  });

  AuthResponseModel copyWith({
    User? user,
    String? token,
    Company? company,
  }) =>
      AuthResponseModel(
        user: user ?? this.user,
        token: token ?? this.token,
        company: company ?? this.company,
      );

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
        company:
            json["company"] == null ? null : Company.fromMap(json["company"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
        "company": company?.toMap(),
      };
}

class Company {
  int? id;
  String? name;
  String? email;
  String? address;
  String? latitude;
  String? longitude;
  String? radiusKm;
  String? timeIn;
  String? timeOut;
  DateTime? createdAt;
  DateTime? updatedAt;

  Company({
    this.id,
    this.name,
    this.email,
    this.address,
    this.latitude,
    this.longitude,
    this.radiusKm,
    this.timeIn,
    this.timeOut,
    this.createdAt,
    this.updatedAt,
  });

  Company copyWith({
    int? id,
    String? name,
    String? email,
    String? address,
    String? latitude,
    String? longitude,
    String? radiusKm,
    String? timeIn,
    String? timeOut,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Company(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        radiusKm: radiusKm ?? this.radiusKm,
        timeIn: timeIn ?? this.timeIn,
        timeOut: timeOut ?? this.timeOut,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        radiusKm: json["radius_km"],
        timeIn: json["time_in"],
        timeOut: json["time_out"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "radius_km": radiusKm,
        "time_in": timeIn,
        "time_out": timeOut,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class User {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic phone;
  String? role;
  String? position;
  int? departmentId;
  dynamic faceEmbedding;
  dynamic imageUrl;
  int? companyId;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.twoFactorSecret,
    this.twoFactorRecoveryCodes,
    this.twoFactorConfirmedAt,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.phone,
    this.role,
    this.position,
    this.departmentId,
    this.faceEmbedding,
    this.imageUrl,
    this.companyId,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    DateTime? emailVerifiedAt,
    dynamic twoFactorSecret,
    dynamic twoFactorRecoveryCodes,
    dynamic twoFactorConfirmedAt,
    dynamic fcmToken,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic phone,
    String? role,
    String? position,
    int? departmentId,
    dynamic faceEmbedding,
    dynamic imageUrl,
    int? companyId,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        twoFactorSecret: twoFactorSecret ?? this.twoFactorSecret,
        twoFactorRecoveryCodes:
            twoFactorRecoveryCodes ?? this.twoFactorRecoveryCodes,
        twoFactorConfirmedAt: twoFactorConfirmedAt ?? this.twoFactorConfirmedAt,
        fcmToken: fcmToken ?? this.fcmToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        phone: phone ?? this.phone,
        role: role ?? this.role,
        position: position ?? this.position,
        departmentId: departmentId ?? this.departmentId,
        faceEmbedding: faceEmbedding ?? this.faceEmbedding,
        imageUrl: imageUrl ?? this.imageUrl,
        companyId: companyId ?? this.companyId,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        twoFactorSecret: json["two_factor_secret"],
        twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        fcmToken: json["fcm_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        phone: json["phone"],
        role: json["role"],
        position: json["position"],
        departmentId: json["department_id"],
        faceEmbedding: json["face_embedding"],
        imageUrl: json["image_url"],
        companyId: json["company_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "two_factor_secret": twoFactorSecret,
        "two_factor_recovery_codes": twoFactorRecoveryCodes,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "fcm_token": fcmToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "phone": phone,
        "role": role,
        "position": position,
        "department_id": departmentId,
        "face_embedding": faceEmbedding,
        "image_url": imageUrl,
        "company_id": companyId,
      };
}
