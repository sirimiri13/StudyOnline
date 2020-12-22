import 'package:flutter/material.dart';
import 'Course.dart';
import 'dart:convert';

Instructor instructorFromJson(String str) => Instructor.fromJson(json.decode(str));

String instructorToJson(Instructor data) => json.encode(data.toJson());

class Instructor extends ChangeNotifier {
  Instructor({
    this.id,
    this.userId,
    this.major,
    this.intro,
    this.skills,
    this.cumulativeTuition,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String userId;
  String major;
  String intro;
  List<String> skills;
  int cumulativeTuition;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    userId: json["userId"],
    major: json["major"],
    intro: json["intro"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    cumulativeTuition: json["cumulativeTuition"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "major": major,
    "intro": intro,
    "skills": List<dynamic>.from(skills.map((x) => x)),
    "cumulativeTuition": cumulativeTuition,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };

  // Instructor.extract(
  //     this.id,
  //     this.name,
  //     this.phone,
  //     this.email,
  //     this.avatar,
  //     );

}




