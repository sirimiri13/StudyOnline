import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/source/Model/Courses.dart';
import 'package:finalproject_1712061/source/Model/ListCourses.dart';
import 'package:finalproject_1712061/source/Model/UserCourse.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'package:http/http.dart' as http;


Future<List<Courses>> listCourseRecommend;
Future<List<UserCourse>>  listUserCourse;
var lenghtCourseUser;
class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();

}



class _HomePage extends State<HomePage> {

  void _fetchData() async {

    listCourseRecommend =  APIServer().fetchTopSellCourses(10, 1);
    listUserCourse = APIServer().fetchUserCourse();
  }

  @override void initState() {
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
          Container(
          child: FutureBuilder<List<Courses>>(
              future: listCourseRecommend,
              builder: (context, snap) {
                if (snap.hasData) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                    ),
                    items: snap.data.map((item) =>
                        GestureDetector(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (_) =>
                              //         ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                              //             child: DetailCoursePage(dataCourse: item))
                              // )
                              // );
                            },
                            child: Container(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius
                                          .all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                              item.imageUrl,
                                              fit: BoxFit.cover,
                                              width: 350.0,
                                              height: 500),
                                          //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color
                                                        .fromARGB(
                                                        200, 0, 0,
                                                        0),
                                                    Color
                                                        .fromARGB(
                                                        0, 0, 0,
                                                        0)
                                                  ],
                                                  begin: Alignment
                                                      .bottomCenter,
                                                  end: Alignment
                                                      .topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets
                                                  .symmetric(
                                                  vertical: 10.0,
                                                  horizontal: 20.0),
                                              child: Text(
                                                item.title,
                                                style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight
                                                      .bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            )
                        )
                    ).toList(),
                  );
                }
                else if (snap.hasError) {
                  print(snap.error);
                }
                return CircularProgressIndicator();
              }
          )
      ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text('Continue?', style: TextStyle(fontSize: 18.0,
              color: Colors.indigo,
              fontWeight: FontWeight.bold)),
        ),
        FutureBuilder<List<Courses>>(
            future: listCourseRecommend,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: GestureDetector(
                      onTap: () {

                      },
                      child: CarouselSlider(
                        options: CarouselOptions(),
                        items: snapshot.data.map((item) =>
                            Container(
                              height: 200,
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                  children: <Widget>[
                                    Image.network(item.imageUrl,
                                        fit: BoxFit.cover,
                                        width: 300.0,
                                        height: 160.0),
                                    Text(item.title,
                                        style: TextStyle(
                                            fontSize: 18.0))
                                  ]
                              ),
                            )).toList(),
                      )
                  ),
                );
              }
              return CircularProgressIndicator();
            }
        ),
        Text('My Courses', style: TextStyle(fontSize: 18.0, color: Colors.indigo,fontWeight: FontWeight.bold)),
        FutureBuilder<List<UserCourse>> (
                future: listUserCourse,
                builder: (context,snapshot){
                  if (snapshot.hasData){
                    return (snapshot.data.length == 0)? Container (
                      alignment: Alignment.center,
                  //    height: 100,
                      child: Text(
                        'There are no  courses!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),):
                        Container (
                          height: 100 * snapshot.data.length.toDouble() + 50,
                          child:  GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (_) =>
                                //         ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                                //             child: DetailCoursePage(dataCourse: listCourses.myCourses[index-4]))
                                // )
                                //);
                              },

                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, indexUserCourse) {
                                    return  Card(
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Image.network(snapshot.data[indexUserCourse].courseImage,width: 125),
                                            Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(snapshot.data[indexUserCourse].courseTitle, style: TextStyle(fontWeight: FontWeight.bold)),
                                                        Text('Author: ' + snapshot.data[indexUserCourse].instructorName),
                                                        Text('Videos: '+ snapshot.data[indexUserCourse].total.toInt().toString()),
                                                        //  RatingBox(),
                                                      ],
                                                    )
                                                )
                                            )
                                          ]
                                      ),
                                    );
                                  }
                              )
                          )
                        );
                  }
                  return CircularProgressIndicator();
                }
            ),
            ],

          )

      ),
    );
  }
}