import 'dart:convert';

UserCourse userCourseFromJson(String str) => UserCourse.fromJson(json.decode(str));

String userCourseToJson(UserCourse data) => json.encode(data.toJson());

class UserCourse {
  UserCourse({
    this.message,
    this.payload,
  });

  String message;
  List<Payload> payload;

  factory UserCourse.fromJson(Map<String, dynamic> json) => UserCourse(
    message: json["message"],
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
  };
}

class Payload {
  Payload({
    this.id,
    this.courseTitle,
    this.courseImage,
    this.instructorId,
    this.instructorName,
    this.latestLearnTime,
    this.total,
    this.learnLesson,
    this.process,
  });

  String id;
  String courseTitle;
  String courseImage;
  String instructorId;
  String instructorName;
  DateTime latestLearnTime;
  double total;
  double learnLesson;
  double process;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    courseTitle: json["courseTitle"],
    courseImage: json["courseImage"],
    instructorId: json["instructorId"],
    instructorName: json["instructorName"],
    latestLearnTime: DateTime.parse(json["latestLearnTime"]),
    total: json["total"].toDouble(),
    learnLesson: json["learnLesson"].toDouble(),
    process: json["process"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "courseTitle": courseTitle,
    "courseImage": courseImage,
    "instructorId": instructorId,
    "instructorName": instructorName,
    "latestLearnTime": latestLearnTime.toIso8601String(),
    "total": total,
    "learnLesson": learnLesson,
    "process": process,
  };
}
