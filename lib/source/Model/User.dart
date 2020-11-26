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

class User with ChangeNotifier{
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

   void editName(String name){
      this.name = name;
   }
}


User myUser = new User(id: '0001',email:'lqh@123.com',avatar: 'Assets/images/profile.jpg',name: 'Lâm Quỳnh Hương',favoriteCategories:[''],phone:'11111',type: '1',isDeleted: false,isActivated:true,createdAt: new DateTime(2020,04, 13) ,updatedAt: new DateTime(2020,04,13));
// User myUser = new User(id: "hghg");
