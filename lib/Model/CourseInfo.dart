import 'dart:convert';
CourseInfo courseInfoFromJson(String str) => CourseInfo.fromJson(json.decode(str));

String courseInfoToJson(CourseInfo data) => json.encode(data.toJson());


class CourseInfo {
  CourseInfo({
    this.id,
    this.title,
    this.subtitle,
    this.price,
    this.description,
  //  this.requirement,
  //  this.learnWhat,
  //  this.soldNumber,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    // this.formalityPoint,
    // this.contentPoint,
    // this.presentationPoint,
    this.imageUrl,
    this.promoVidUrl,
    this.status,
    this.isDeleted,
    this.isHidden,
    this.createdAt,
    this.updatedAt,
    this.instructorId,
  // this.categoryIds,
  });

  String id;
  String title;
  String subtitle;
  double price;
  String description;
 // List<String> requirement;
 // List<String> learnWhat;
 // double soldNumber;
  double ratedNumber;
  double videoNumber;
  double totalHours;
  // double formalityPoint;
  // double contentPoint;
  // double presentationPoint;
  String imageUrl;
  String promoVidUrl;
  String status;
  bool isDeleted;
  bool isHidden;
  DateTime createdAt;
  DateTime updatedAt;
  String instructorId;
 //  List<String> categoryIds;

  factory CourseInfo.fromJson(Map<String, dynamic> json) => CourseInfo(
    id: json["id"],
    title: json["title"],
    subtitle: json["subtitle"],
    price: json["price"].toDouble(),
    description: json["description"],
  //  requirement: List<String>.from(json["requirement"].map((x) => x)),
   // learnWhat: List<String>.from(json["learnWhat"].map((x) => x)),
  //  soldNumber: json["soldNumber"].toDouble(),
    ratedNumber: json["ratedNumber"].toDouble(),
    videoNumber: json["videoNumber"].toDouble(),
    totalHours: json["totalHours"].toDouble(),
    // formalityPoint: json["formalityPoint"].toDouble(),
    // contentPoint: json["contentPoint"].toDouble(),
    // presentationPoint: json["presentationPoint"].toDouble(),
    imageUrl: json["imageUrl"],
    promoVidUrl: json["promoVidUrl"],
    status: json["status"],
    isDeleted: json["isDeleted"],
    isHidden: json["isHidden"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    instructorId: json["instructorId"],
   // categoryIds: List<String>.from(json["categoryIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "subtitle": subtitle,
    "price": price,
    "description": description,
    // "requirement": List<dynamic>.from(requirement.map((x) => x)),
    // "learnWhat": List<dynamic>.from(learnWhat.map((x) => x)),
  //  "soldNumber": soldNumber,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    // "formalityPoint": formalityPoint,
    // "contentPoint": contentPoint,
    // "presentationPoint": presentationPoint,
    "imageUrl": imageUrl,
    "promoVidUrl": promoVidUrl,
    "status": status,
    "isDeleted": isDeleted,
    "isHidden": isHidden,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "instructorId": instructorId,
   //  "categoryIds": List<dynamic>.from(categoryIds.map((x) => x)),
  };
}
