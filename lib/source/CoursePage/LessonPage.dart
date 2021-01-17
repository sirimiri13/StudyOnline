import 'dart:convert';

import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/source/CoursePage/Video.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget{
  Section section;
  String videoURL;
  static String tag = 'list-course';
  LessonPage({Key key, this.section,this.videoURL}) : super(key: key);
  @override
  _LessonPage createState() => new _LessonPage();
}


class _LessonPage extends State<LessonPage>{
  @override void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Courses'),
        ),
        body: ListView.builder(
          itemCount: widget.section.lesson.length,
          itemBuilder: (context,index) {
            return Container(
                child : GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoURL: widget.videoURL,))
                      );
                    },
                    child: Card(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Lesson ${index + 1}: ${widget.section.lesson[index].name}",style: TextStyle(fontWeight: FontWeight.bold)),
                                        // RatingBox(),
                                      ],
                                    )
                                )
                            )
                          ]
                      ),
                    )
                )
            );
          },
        )
    );
  }
}

