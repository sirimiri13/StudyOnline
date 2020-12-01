 import 'package:flutter/material.dart';

import 'dart:convert';

import 'ListClip.dart';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
    this.requirement,
    this.learnWhat,
    this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.formalityPoint,
    this.contentPoint,
    this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.isDeleted,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
    this.categoryIds,
    this.downloaded,
  });

  String id;
  String title;
  String subtitle;
  int price;
  String description;
  List<String> requirement;
  List<String> learnWhat;
  int soldNumber;
  int ratedNumber;
  int videoNumber;
  int totalHours;
  int formalityPoint;
  int contentPoint;
  int presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  bool isDeleted;
  bool isHidden;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
  List<String> categoryIds;
  bool downloaded;

  void addCourse(List<Course> listCourse, Course newCourse){
    listCourse.add(newCourse);
  }

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"],
    description: json["description"],
    requirement: List<String>.from(json["requirement"].map((x) => x)),
    learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
    soldNumber: json["soldNumber"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"],
    formalityPoint: json["formalityPoint"],
    contentPoint: json["contentPoint"],
    presentationPoint: json["presentationPoint"],
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    isHidden: json["isHidden"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
    categoryIds: List<String>.from(json["categoryIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "description": description,
    "requirement": List<dynamic>.from(requirement.map((x) => x)),
    "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
    "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "formalityPoint": formalityPoint,
    "contentPoint": contentPoint,
    "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl,
    "status": status,
    "isDeleted": isDeleted,
    "isHidden": isHidden,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
    "categoryIds": List<dynamic>.from(categoryIds.map((x) => x)),

  };
}




 // void createCourse(List<Course> listCourse){
 //   Course myCourse = new Course(id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
 //       title: "Lập trình Android toàn tập",
 //       subtitle: "Hướng dẫn Reactjs, React Router 4, Animations, Authentication, BDD và nhiều hơn nữa!",
 //       price: 249000,
 //       description: "Lập trình Android không khó, vì khóa học này sẽ hướng dẫn bạn chi tiết về lập trình Android, cung cấp thủ thuật về ASO giúp bạn tăng thu nhập với lập trình Android.",
 //       requirement: [
 //         "thông minh",
 //         "đã biết lập trình cơ bản"
 //       ],
 //       learnWhat: [
 //         "Tự tin phát triển những ứng dụng Android, game Android",
 //         "Biết cách upload ứng dụng Android lên Google Play",
 //         "Kiếm tiền từ các ứng dụng trên Google Play",
 //         "ASO - tối ưu ứng dụng lên TOP tìm kiếm từ khoá"
 //       ],
 //       soldNumber: 5,
 //       ratedNumber: 5,
 //       videoNumber: 5,
 //       totalHours: 5,
 //       formalityPoint: 5,
 //       contentPoint: 5,
 //       presentationPoint: 5,
 //       imageUrl: "Assets/images/code2.jpg",
 //       promoVidUrl: "Assets/images/code2.jpg",
 //       status: "PENDING",
 //       isDeleted: true,
 //       isHidden: true,
 //       createdAt: new DateTime(2020,04,21),
 //       updatedAt: new DateTime(2020,04,21),
 //       instructorId: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
 //       categoryIds: [
 //         "3fa85f64-5717-4562-b3fc-2c963f66afa6"
 //       ]);
 //
 //   listCourse.add(myCourse);
 // }