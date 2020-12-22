// import 'package:flutter/material.dart';
// import 'Course.dart';
// import 'Clip.dart';
//
// class User {
//    String lastName;
//    String firstName;
//    String email;
//    List<Course> registeredCourse;
//    List<Clip> downloadedClip;
//   User(this.lastName, this.firstName, this.email,this.registeredCourse,this.downloadedClip);
// }
//


// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends ChangeNotifier{
   User({
      this.id,
      this.email,
      this.avatar,
      this.name,
      this.favoriteCategories,
      this.phone,
      this.type,
      this.isDeleted,
      this.isActivated,
      this.createdAt,
      this.updatedAt,
   });

   String id;
   String email;
   String avatar;
   String name;
   List<String> favoriteCategories;
   String phone;
   String type;
   bool isDeleted;
   bool isActivated;
   DateTime createdAt;
   DateTime updatedAt;

   factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      avatar: json["avatar"],
      name: json["name"],
      favoriteCategories: List<String>.from(json["favoriteCategories"].map((x) => x)),
      phone: json["phone"],
      type: json["type"],
      isDeleted: json["isDeleted"],
      isActivated: json["isActivated"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
   );

   Map<String, dynamic> toJson() => {
      "id": id,
      "email": email,
      "avatar": avatar,
      "name": name,
      "favoriteCategories": List<dynamic>.from(favoriteCategories.map((x) => x)),
      "phone": phone,
      "type": type,
      "isDeleted": isDeleted,
      "isActivated": isActivated,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
   };

   void updateAvatar(String avatar){
      this.avatar = avatar;
      notifyListeners();
   }

   void editName(String str){
      this.name = str;
      notifyListeners();
   }
   void editEmail(String str){
      this.email = str;
      notifyListeners();
   }
   void editPhone(String str){
      this.phone = str;
      notifyListeners();
   }
}


// userme

UserMe userMeFromJson(String str) => UserMe.fromJson(json.decode(str));

String userMeToJson(UserMe data) => json.encode(data.toJson());

class UserMe extends ChangeNotifier{
   UserMe({
      this.message,
      this.payload,
   });

   String message;
   Payload payload;

   factory UserMe.fromJson(Map<String, dynamic> json) => UserMe(
      message: json["message"],
      payload: Payload.fromJson(json["payload"]),
   );

   Map<String, dynamic> toJson() => {
      "message": message,
      "payload": payload.toJson(),
   };
}

class Payload {
   Payload({
      this.id,
      this.email,
      this.avatar,
      this.name,
      this.favoriteCategories,
      this.point,
      this.phone,
      this.type,
      this.facebookId,
      this.googleId,
      this.isDeleted,
      this.isActivated,
      this.createdAt,
      this.updatedAt,
   });

   String id;
   String email;
   String avatar;
   dynamic name;
   List<dynamic> favoriteCategories;
   int point;
   String phone;
   String type;
   dynamic facebookId;
   dynamic googleId;
   bool isDeleted;
   bool isActivated;
   DateTime createdAt;
   DateTime updatedAt;

   factory Payload.fromJson(Map<String, dynamic> json) => Payload(
      id: json["id"],
      email: json["email"],
      avatar: json["avatar"],
      name: json["name"],
      favoriteCategories: List<dynamic>.from(json["favoriteCategories"].map((x) => x)),
      point: json["point"],
      phone: json["phone"],
      type: json["type"],
      facebookId: json["facebookId"],
      googleId: json["googleId"],
      isDeleted: json["isDeleted"],
      isActivated: json["isActivated"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
   );

   Map<String, dynamic> toJson() => {
      "id": id,
      "email": email,
      "avatar": avatar,
      "name": name,
      "favoriteCategories": List<dynamic>.from(favoriteCategories.map((x) => x)),
      "point": point,
      "phone": phone,
      "type": type,
      "facebookId": facebookId,
      "googleId": googleId,
      "isDeleted": isDeleted,
      "isActivated": isActivated,
      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
   };
}