import 'dart:convert';
SearchCourse searchCourseFromJson(String str) => SearchCourse.fromJson(json.decode(str));

String searchCourseToJson(SearchCourse data) => json.encode(data.toJson());

class SearchCourse {
  SearchCourse({
    this.title,
    this.id,
    this.price,
    this.description,
    this.ratedNumber,
    this.videoNumber,
    this.totalHours,
    this.imageUrl,
    this.name,
  });

  String title;
  String id;
  int price;
  String description;
  int ratedNumber;
  int videoNumber;
  double totalHours;
  String imageUrl;
  String name;

  factory SearchCourse.fromJson(Map<String, dynamic> json) => SearchCourse(
    title: json["title"],
    id: json["id"],
    price: json["price"],
    description: json["description"],
    ratedNumber: json["ratedNumber"],
    videoNumber: json["videoNumber"],
    totalHours: json["totalHours"].toDouble(),
    imageUrl: json["imageUrl"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "id": id,
    "price": price,
    "description": description,
    "ratedNumber": ratedNumber,
    "videoNumber": videoNumber,
    "totalHours": totalHours,
    "imageUrl": imageUrl,
    "name": name,
  };
}