import 'package:flutter/material.dart';
import 'Instructor.dart';
import 'ListCourses.dart';
import 'Course.dart';


class ListInstructor extends ChangeNotifier{
  final List<Instructor> _listInstructor = [
    Instructor.extract("I0001", "NLHDung", "01999999", "nlhdung@instructor","Assets/images/profile.jpg"),
    Instructor.extract("I0002", "PHHai", "01999999", "phh@instructor","Assets/images/profile-2.jpg"),
    Instructor.extract("I0003", "HTThanh", "01999999", "htt@instructor","Assets/images/profile-3.jpg" ),
    Instructor.extract("I0004", "ctn", "01999999", "ctn@instructor","Assets/images/profile.jpg"),

  ];
  List<Instructor> get listInstructor => _listInstructor;
}