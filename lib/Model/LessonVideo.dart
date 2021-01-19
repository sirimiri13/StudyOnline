import 'dart:convert';

LessonVideo lessonVideoModelFromJson(String str) => LessonVideo.fromJson(json.decode(str));

String lessonVideoToJson(LessonVideo data) => json.encode(data.toJson());

class LessonVideo {
  LessonVideo({
    this.videoUrl,
    this.currentTime,
    this.isFinish,
  });

  String videoUrl;
  dynamic currentTime;
  dynamic isFinish;

  factory LessonVideo.fromJson(Map<String, dynamic> json) => LessonVideo(
    videoUrl: json["videoUrl"],
    currentTime: json["currentTime"],
    isFinish: json["isFinish"],
  );

  Map<String, dynamic> toJson() => {
    "videoUrl": videoUrl,
    "currentTime": currentTime,
    "isFinish": isFinish,
  };
}
