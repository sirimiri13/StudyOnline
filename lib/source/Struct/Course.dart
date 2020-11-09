import 'package:flutter/material.dart';

class Course {
  final String name;
  final String image;
  final String teacher;
  final int totalClip;
  Course(this.name,this.image,this.teacher,this.totalClip);
}

List<Course> getCourseSuggest() {
  List<Course> itemCourseSuggest = <Course>[];
    itemCourseSuggest.add(
      Course(
        "Tutorial Flutter",
        'Assets/images/code1.jpg',
        "Lucifer",
        10
      )
    );
  itemCourseSuggest.add(
      Course(
          "Tutorial Python",
          'Assets/images/code2.jpg',
          "Justin",
          5
      )
  );
  itemCourseSuggest.add(
      Course(
          "Mockup",
          'Assets/images/code8.jpg',
          "Roses",
          7
      )
  );
  itemCourseSuggest.add(
      Course(
          "Computer Vision",
         'Assets/images/code5.jpg',
          "David",
          20
      )
  );
  itemCourseSuggest.add(
      Course(
          "SQL",
         'Assets/images/code7.jpg',
          "Bob",
          6
      )
  );
  return itemCourseSuggest;
}

List<Course> getCourseContinue() {
  List<Course> itemCourseContinue = <Course>[];
  itemCourseContinue.add(
      Course(
          "Tutorial Flutter",
          'Assets/images/code1.jpg',
          "Lucifer",
          10
      )
  );
  itemCourseContinue.add(
      Course(
          "Tutorial Python",
          'Assets/images/code2.jpg',
          "Justin",
          5
      )
  );
  itemCourseContinue.add(
      Course(
          "Mockup",
          'Assets/images/code4.jpg',
          "Roses",
          7
      )
  );
  itemCourseContinue.add(
      Course(
          "Computer Vision",
          'Assets/images/code5.jpg',
          "David",
          20
      )
  );
  itemCourseContinue.add(
      Course(
          "SQL",
          'Assets/images/code7.jpg',
          "Bob",
          6
      )
  );
  return itemCourseContinue;
}