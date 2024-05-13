import 'dart:convert';

class NoteResponseModel {
  List<Note>? notes;

  NoteResponseModel({
    this.notes,
  });

  NoteResponseModel copyWith({
    List<Note>? notes,
  }) =>
      NoteResponseModel(
        notes: notes ?? this.notes,
      );

  factory NoteResponseModel.fromJson(String str) =>
      NoteResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NoteResponseModel.fromMap(Map<String, dynamic> json) =>
      NoteResponseModel(
        notes: json["notes"] == null
            ? []
            : List<Note>.from(json["notes"]!.map((x) => Note.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "notes": notes == null
            ? []
            : List<dynamic>.from(notes!.map((x) => x.toMap())),
      };
}

class Note {
  int? id;
  int? userId;
  String? title;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;

  Note({
    this.id,
    this.userId,
    this.title,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  Note copyWith({
    int? id,
    int? userId,
    String? title,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Note(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Note.fromJson(String str) => Note.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Note.fromMap(Map<String, dynamic> json) => Note(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        note: json["note"],
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
        "title": title,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
