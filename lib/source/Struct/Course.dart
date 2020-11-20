import 'package:flutter/material.dart';
import 'Clip.dart';

class Course {
  String courseID;
  String courseName;
  String courseDescription;
  String keyword;
  DateTime releaseDate;
  double point;
  List<Clip> clipInCourse;
  Clip courseTrailer;
  Course(this.courseID,this.courseName,this.courseDescription,this.keyword,this.releaseDate,this.point,this.clipInCourse,this.courseTrailer);


  void createCourse(String _courseID,String _courseName,String _courseDescription, String _keyword,DateTime _releaseDate, double _point, List<Clip> _listClip,Clip _trailer){
    this.courseID = _courseID;
    this.courseName = _courseName;
    this.courseDescription = _courseDescription;
    this.keyword = _keyword;
    this.releaseDate = _releaseDate;
    this.point = _point;
    this.clipInCourse = _listClip;
    this.courseTrailer = _trailer;
  }

  void addClip(Clip newClip){
    this.clipInCourse.add(newClip);
  }
}
//
// List<Course> getCourseSuggest() {
//   List<Course> itemCourseSuggest = <Course>[];
//     itemCourseSuggest.add(
//       Course(
//         "Tutorial Flutter",
//         'Assets/images/code1.jpg',
//         "Lucifer",
//         10
//       )
//     );
//   itemCourseSuggest.add(
//       Course(
//           "Tutorial Python",
//           'Assets/images/code2.jpg',
//           "Justin",
//           5
//       )
//   );
//   itemCourseSuggest.add(
//       Course(
//           "Mockup",
//           'Assets/images/code8.jpg',
//           "Roses",
//           7
//       )
//   );
//   itemCourseSuggest.add(
//       Course(
//           "Computer Vision",
//          'Assets/images/code5.jpg',
//           "David",
//           20
//       )
//   );
//   itemCourseSuggest.add(
//       Course(
//           "SQL",
//          'Assets/images/code7.jpg',
//           "Bob",
//           6
//       )
//   );
//   return itemCourseSuggest;
// }
//
// List<Course> getCourseContinue() {
//   List<Course> itemCourseContinue = <Course>[];
//   itemCourseContinue.add(
//       Course(
//           "Tutorial Flutter",
//           'Assets/images/code1.jpg',
//           "Lucifer",
//           10
//       )
//   );
//   itemCourseContinue.add(
//       Course(
//           "Tutorial Python",
//           'Assets/images/code2.jpg',
//           "Justin",
//           5
//       )
//   );
//   itemCourseContinue.add(
//       Course(
//           "Mockup",
//           'Assets/images/code8.jpg',
//           "Roses",
//           7
//       )
//   );
//   itemCourseContinue.add(
//       Course(
//           "Computer Vision",
//           'Assets/images/code5.jpg',
//           "David",
//           20
//       )
//   );
//   itemCourseContinue.add(
//       Course(
//           "SQL",
//           'Assets/images/code7.jpg',
//           "Bob",
//           6
//       )
//   );
//   return itemCourseContinue;
// }