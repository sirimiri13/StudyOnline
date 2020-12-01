import 'package:flutter/material.dart';
import 'Course.dart';
import 'dart:convert';

Instructor instructorFromJson(String str) => Instructor.fromJson(json.decode(str));

String instructorToJson(Instructor data) => json.encode(data.toJson());

class Instructor extends ChangeNotifier {
  Instructor({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.avatar,
    this.phone,
    this.major,
    this.intro,
    this.skills,
    this.createdAt,
    this.updatedAt,
    this.totalCourse,
    this.averagePoint,
    this.countRating,
    this.ratedNumber,
    this.soldNumber,
    this.courses,
  });

  String id;
  String userId;
  String name;
  String email;
  String avatar;
  String phone;
  String major;
  String intro;
  List<String> skills;
  DateTime createdAt;
  DateTime updatedAt;
  int totalCourse;
  int averagePoint;
  int countRating;
  int ratedNumber;
  int soldNumber;
  List<Course> courses;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    userId: json["userId"],
    name: json["name"],
    email: json["email"],
    avatar: json["avatar"],
    phone: json["phone"],
    major: json["major"],
    intro: json["intro"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    totalCourse: json["totalCourse"],
    averagePoint: json["averagePoint"],
    countRating: json["countRating"],
    ratedNumber: json["ratedNumber"],
    soldNumber: json["soldNumber"],
    courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "name": name,
    "email": email,
    "avatar": avatar,
    "phone": phone,
    "major": major,
    "intro": intro,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "totalCourse": totalCourse,
    "averagePoint": averagePoint,
    "countRating": countRating,
    "ratedNumber": ratedNumber,
    "soldNumber": soldNumber,
    "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
  };
  Instructor.extract(
      this.id,
      this.name,
      this.phone,
      this.email,
      this.avatar,
      );

}




