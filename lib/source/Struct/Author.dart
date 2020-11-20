import 'package:flutter/material.dart';
import 'Course.dart';

class Author {
  String authorName;
  String authorDescription;
  String authorImage;
  List<Course> listCourse;
  Author(this.authorName,this.authorDescription,this.authorImage,this.listCourse);


  void createAuthor(String _authorName, String _authorDescription, String _authorImage, List<Course> _listCourse){
    this.authorName = _authorName;
    this.authorDescription = _authorDescription;
    this.authorImage = _authorImage;
    this.listCourse = _listCourse;
  }

  void addCourse(Course newCourse){
    this.listCourse.add(newCourse);
  }
}


// final listCourse = getCourseSuggest();
//
//
// List<Author> getListAuthor(){
//   List<Author> _author = [];
//   _author.add(Author(
//       "David",
//     "Assets/images/profile-2.jpg",
//     listCourse,
//    )
//   );
//   _author.add(Author(
//     "Bobs",
//     "Assets/images/profile.jpg",
//     listCourse,
//   )
//   );
//   _author.add(Author(
//     "Roses",
//     "Assets/images/profile-2.jpg",
//     listCourse,
//   )
//   );
//   _author.add(Author(
//     "Babe",
//     "Assets/images/profile.jpg",
//     listCourse,
//   )
//   );
//   _author.add(Author(
//     "Justin",
//     "Assets/images/profile-2.jpg",
//     listCourse,
//   )
//   );
//   _author.add(Author(
//     "Lucifer",
//     "Assets/images/profile.jpg",
//     listCourse,
//   )
//   );
//   return _author;
// }
