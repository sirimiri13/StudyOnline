import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Course.dart';
import 'DetailCoursePage.dart';
import '../Model/ListCourses.dart';
import '../../API/APIServer.dart';
import 'package:http/http.dart' as http;
import '../Model/Courses.dart';

class ListCoursePage extends StatefulWidget{
  Future<Courses> listCourse;
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
        body: FutureBuilder<Courses>(
          future: widget.listCourse,
          builder: (context,snap){
            if (snap.hasData){
              return  ListView.builder(
                  itemCount: snap.data.payload.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      height: 100,
                      child: GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (_) =>
                            //         ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                            //             child:(DetailCoursePage(dataCourse: widget.dataCourse[index])))
                            // )
                            // );
                          },
                          child: Card(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.network(snap.data.payload[index].imageUrl,width: 125),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              Text(snap.data.payload[index].title, style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                              Text('Total clip: ${snap.data.payload[index].videoNumber}'),
                                              Text('Hour: ${snap.data.payload[index].totalHours}'),
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

