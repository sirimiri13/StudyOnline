import 'package:flutter/material.dart';
import 'Course.dart';

class Author {
  final String name;
  final String image;
  final List<Course> course;
  Author(this.name,this.image,this.course);
}
final listCourse = getCourseSuggest();


List<Author> getListAuthor(){
  List<Author> _author = [];
  _author.add(Author(
      "David",
    "Assets/images/profile-2.jpg",
    listCourse,
   )
  );
  _author.add(Author(
    "Bobs",
    "Assets/images/profile.jpg",
    listCourse,
  )
  );
  _author.add(Author(
    "Roses",
    "Assets/images/profile-2.jpg",
    listCourse,
  )
  );
  _author.add(Author(
    "Babe",
    "Assets/images/profile.jpg",
    listCourse,
  )
  );
  _author.add(Author(
    "Justin",
    "Assets/images/profile-2.jpg",
    listCourse,
  )
  );
  _author.add(Author(
    "Lucifer",
    "Assets/images/profile.jpg",
    listCourse,
  )
  );
  return _author;
}
