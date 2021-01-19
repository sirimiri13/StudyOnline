import 'dart:convert';

import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/Exercise.dart';
import 'package:finalproject_1712061/source/CoursePage/PlayVideoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget{
  String courseId;
  Lesson lesson;
  static String tag = 'list-course';
  ExercisePage({Key key,this.courseId, this.lesson}) : super(key: key);
  @override
  _ExercisePage createState() => new _ExercisePage();
}


class _ExercisePage extends State<ExercisePage>{
  bool isLoaded = false;
  List<Exercise> listExercise;
  void _fetchData() async{
    listExercise = await APIServer().fetchExercises(widget.lesson.id);
    setState(() {
      isLoaded = true;
    });
  }
  @override void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('EXERCISES'),
      ),
      body:  Container(
          child: Column(
            children: [

              listExercise == null || listExercise.length == 0 ? Container(
                height: 50,
                child: Center(
                  child: Text("NO EXERCISES"),
                )   ,
              ) :
              Container(
                  height: listExercise.length.toDouble()*60,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:listExercise.length,
                      itemBuilder: (context, index) {
                        return Container(
                            child: GestureDetector(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                              "Exercise ${index}: " +
                                                  listExercise[index].title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                  ),
                                )
                            )
                        );
                      }
                  )
              ),
              Container(
                  child: FlatButton(
                      color:  Colors.indigo,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VideoPlayerScreen(courseId: widget.courseId,lesson: widget.lesson,))
                        );
                      },
                      child: Text('Play Video',style: TextStyle(color: Colors.white),)
                  )
              ),
            ],
          )
      ),
    );

  }
}
