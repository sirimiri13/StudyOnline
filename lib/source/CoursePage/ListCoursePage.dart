import 'dart:convert';

import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/Courses.dart';
import 'package:finalproject_1712061/source/CoursePage/InfomartionCoursePage.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:flutter/material.dart';


class ListCoursePage extends StatefulWidget{
  Future<List<Courses>> listCourse;
  static String tag = 'list-course';
  ListCoursePage({Key key, this.listCourse}) : super(key: key);
  @override
  _ListCoursePage createState() => new _ListCoursePage();
}



class _ListCoursePage extends State<ListCoursePage>{
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
        body: FutureBuilder<List<Courses>>(
          future: widget.listCourse,
          builder: (context,snap){
            if (snap.hasData){
              return  ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      height: 100,
                      child: GestureDetector(
                          onTap: () async {
                            CourseInfo courseInfo = await APIServer().getCourseInfo(snap.data[index].id,null);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InformationCoursePage(Courses: courseInfo,))
                            );
                          },
                          child: Card(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.network(snap.data[index].imageUrl,width: 125),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              Text(snap.data[index].title, style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                             // Text(snap.data[index].subtitle),
                                              Text('Total clip: ${snap.data[index].videoNumber}'),
                                            //  Text('Rated: ${snap.data[index].ratedNumber}'),
                                            //  Text('Hour: ${snap.data[index].}'),
                                            ],
                                          )
                                      )
                                  )
                                ]
                            ),
                          )
                      ),
                    );
                  }
              );
            }
            else if (snap.hasError){
              print("error ${snap.error}");
            }
            return CircularProgressIndicator();
          },
        )

      );
              }
  }

