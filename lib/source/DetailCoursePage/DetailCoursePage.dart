import 'package:flutter/material.dart';
import '../Struct/Course.dart';

class DetailCoursePage extends StatefulWidget{
  static String tag = 'detail-course-page';
  final Course dataCourse;
  DetailCoursePage({Key key, this.dataCourse}) : super(key: key);
  Course getDataCourse(){
    return dataCourse;
  }
  _DetailCoursePage createState() => new _DetailCoursePage();
}

//Course _dataCourse;
class _DetailCoursePage extends State<DetailCoursePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Detail Course'),
      ),
    );

  }
}