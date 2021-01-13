import 'dart:convert';

import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/Category.dart';
import 'package:finalproject_1712061/Model/Courses.dart';
import 'package:finalproject_1712061/Model/Instructor.dart';
import 'package:finalproject_1712061/Model/InstructorDetail.dart';

import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

import 'package:carousel_slider/carousel_slider.dart';
import '../CoursePage/ListCoursePage.dart';





final _listSkill = ['C++','Swift','Machine Learning'];
class BrowsePage extends StatefulWidget{
  static String tag = 'browse-page';
  @override _BrowsePage createState() => new _BrowsePage();
}



class _BrowsePage extends State<BrowsePage>{
  Future<Category> category;
  Future<List<Instructor>> listInstructor;

  bool _isLoading = false;

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    listInstructor =  APIServer().fetchInstructors();
    category = APIServer().getCategory();
    setState(() {
      _isLoading = false;
    });
  }

  @override void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only( top: 10.0),
            child: ListView.builder  (
                scrollDirection: Axis.vertical,
                itemCount: 8,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                        margin: EdgeInsets.all(5.0),
                        child: ImageButton(
                          children: <Widget>[
                            Text('NEW COURSES', style: TextStyle(
                                color: Colors.white, fontSize: 30.0)),
                          ],
                          width: double.infinity,
                          height: 200,
                          paddingTop: 5,
                          pressedImage: Image.asset(
                            "Assets/images/code8.jpg",
                          ),
                          unpressedImage: Image.asset(
                            "Assets/images/code8.jpg",),
                          onTap: () {
                            Future<List<Courses>>  listCourse = APIServer().fetchNewCourses(10, 1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListCoursePage(listCourse: listCourse)),
                            );
                          },
                        )
                    );
                  }
                  else if (index == 1) {
                    return Container(
                      margin: EdgeInsets.all(5.0),
                      child: ImageButton(
                        children: <Widget>[
                          Text('FOR YOU', style: TextStyle(
                              color: Colors.white, fontSize: 30.0)),
                        ],
                        width: double.infinity,
                        height: 200,
                        paddingTop: 5,
                        pressedImage: Image.asset(
                          "Assets/images/code3.jpg",
                        ),
                        unpressedImage: Image.asset(
                          "Assets/images/code3.jpg",),
                        onTap: () {
                          Future<List<Courses>> listCourse = APIServer().fetchTopRateCourses(10, 1);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListCoursePage(listCourse: listCourse,)),
                          );
                        },
                      ),
                    );
                  }
                  else if (index == 2) {
                    return Container(
                      padding: EdgeInsets.only(left: 10.0),
                      margin: EdgeInsets.all(5.0),
                      child: Text('TOPIC', style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                    );
                  }
                  else if (index == 3) {
                    return Container(
                        child: FutureBuilder<Category>(
                            future: category,
                            builder: (context,snap){
                              if (snap.hasData){
                                return CarouselSlider(
                                    options: CarouselOptions(
                                      aspectRatio: 2.0,
                                      enlargeCenterPage: true,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                    items: snap.data.payload.map((item) =>
                                        GestureDetector(
                                            onTap: () {
                                              // print(index);
                                              // List<Course> data;
                                              // if (item == 'C++') {
                                              //   data = listCourses.listCourseC;
                                              // }
                                              // else {
                                              //   if (item == 'Swift') {
                                              //     data = listCourses.listCourseSwift;
                                              //   }
                                              //   else {
                                              //     data = listCourses.listCourseML;
                                              //   }
                                              // }
                                              // Navigator.push(context, MaterialPageRoute(
                                              //     builder: (_) =>
                                              //         ChangeNotifierProvider.value(
                                              //             value: Provider.of<ListCourses>(
                                              //                 context, listen: false),
                                              //             child: ListCoursePage(
                                              //                 dataCourse: data))
                                              // )
                                              // );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.all(2.0),
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0)),
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Image.asset("Assets/images/code4.jpg",
                                                          fit: BoxFit.cover, width: 350.0),
                                                      //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                                      Positioned(
                                                        bottom: 0.0,
                                                        left: 0.0,
                                                        right: 0.0,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            gradient: LinearGradient(
                                                              colors: [
                                                                Color.fromARGB(200, 0, 0, 0),
                                                                Color.fromARGB(0, 0, 0, 0)
                                                              ],
                                                              begin: Alignment.bottomCenter,
                                                              end: Alignment.topCenter,
                                                            ),
                                                          ),
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: 10.0,
                                                              horizontal: 20.0),
                                                          child: Text(item.name,
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20.0,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            )
                                        )).toList()
                                );
                              }
                              else if (snap.hasError){
                                print(snap.error);
                              }
                              return CircularProgressIndicator();
                            }
                        )
                    );
                  }
                  else if (index == 4) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text('Skills', style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                    );
                  }
                  else if (index == 5) {
                    return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.0, vertical: 7.0),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _listSkill.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    // print(index);
                                    // List<Course> data;
                                    // if (index == 0) {
                                    //   data = listCourses.listCourseC;
                                    // }
                                    // else {
                                    //   if (index == 1) {
                                    //     data = listCourses.listCourseSwift;
                                    //   }
                                    //   else {
                                    //     data = listCourses.listCourseML;
                                    //   }
                                    // }
                                    // Navigator.push(context, MaterialPageRoute(
                                    //     builder: (_) =>
                                    //         ChangeNotifierProvider.value(
                                    //             value: Provider.of<ListCourses>(
                                    //                 context, listen: false),
                                    //             child: ListCoursePage(
                                    //                 dataCourse: data))
                                    // )
                                    // );
                                  },
                                  child: Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.4,
                                    child: Card(
                                      color: Colors.black12,
                                      child: Container(

                                        child: Center(
                                            child: Text(_listSkill[index],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0),)),
                                      ),
                                    ),
                                  )
                              );
                            }
                        )
                    );
                  }
                  else if (index == 6) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text(
                          'Top Author', style: TextStyle(color: Colors
                          .indigo, fontSize: 25.0, fontWeight: FontWeight
                          .bold)),
                    );
                  }
                  else {
                    return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.0, vertical: 18.0),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.25,
                        child: FutureBuilder<List<Instructor>> (
                          future: listInstructor,
                          builder: (context, snapshot){
                            if (snapshot.hasData){
                              return
                                ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.length ?? 0,
                                    itemBuilder: (context, indexAuthor) {
                                      return Container(
                                          padding: EdgeInsets.only(right: 15.0),
                                          child: Card(
                                            // color: Colors.transparent
                                            //color: Colors.black12,
                                              child: Container(
                                                child: GestureDetector(
                                                  onTap: () {

                                                  },
                                                  child: Center(
                                                      child: Column(
                                                          children: <Widget>[
                                                            CircleAvatar(
                                                              radius: 50,
                                                              backgroundImage: NetworkImage(snapshot.data[indexAuthor].userAvatar),
                                                            ),
                                                            Text(snapshot.data[indexAuthor].userName, style: TextStyle(
                                                                fontSize: 11.0)),
                                                          ]
                                                      )
                                                  ),
                                                ),
                                              )
                                          )
                                      );
                                    }

                                );
                            }
                            else if (snapshot.hasError) {
                              return Text("${snapshot.data}");
                            }
                            return CircularProgressIndicator();
                          },
                        )
                    );


                  }
                })

        )
    );
  }


}