import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/source/Model/Courses.dart';
import 'package:finalproject_1712061/source/Model/UserCourse.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


import 'package:http/http.dart' as http;


Future<Courses> listCourseRecommend;
Future<UserCourse> listUserCourse;
class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();

}



class _HomePage extends State<HomePage> {

  fetchDataRecomment() {
    listCourseRecommend = APIServer().getNewCourse(5, 1);
    listUserCourse = APIServer().getUserCourse();
  }


  @override void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchDataRecomment();
    });
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
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            // itemCount: listCourseRegister.length + 4,
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                    child: FutureBuilder<Courses>(
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
                              items: snap.data.payload.map((item) =>
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
                );
              }
              else if (index == 1)
                return Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text('Continue?', style: TextStyle(fontSize: 18.0,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold)),
                );
              else if (index == 2)
                return FutureBuilder<Courses>(
                    future: listCourseRecommend,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: GestureDetector(
                              onTap: () {

                              },
                              child: CarouselSlider(
                                options: CarouselOptions(),
                                items: snapshot.data.payload.map((item) =>
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
                );

              else if (index == 3)
                return Text('My Courses', style: TextStyle(fontSize: 18.0, color: Colors.indigo,fontWeight: FontWeight.bold));
              else
                return Container(padding: EdgeInsets.all(2),
                    height: 100,
                    child : FutureBuilder<UserCourse> (
                        future: listUserCourse,
                        builder: (context,snapshot){
                          if (snapshot.hasData){
                            return (snapshot.data.payload.length == 0)? Container (
                              alignment: Alignment.center,
                              child: Text(
                                'There are no  courses!',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),):
                            GestureDetector(
                                onTap: () {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //     builder: (_) =>
                                  //         ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                                  //             child: DetailCoursePage(dataCourse: listCourses.myCourses[index-4]))
                                  // )
                                  //);
                                },
                                child: Card(
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Image.network(snapshot.data.payload[index-4].courseImage,width: 125),
                                        Expanded(
                                            child: Container(
                                                padding: EdgeInsets.all(5),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(snapshot.data.payload[index-4].courseTitle, style: TextStyle(fontWeight: FontWeight.bold)),
                                                    Text('Author: ' + snapshot.data.payload[index-4].instructorName),
                                                    //  RatingBox(),
                                                  ],
                                                )
                                            )
                                        )
                                      ]
                                  ),
                                )
                            );
                          };
                          return CircularProgressIndicator();
                        }
                    )
                );
            },

          )

      ),
    );
  }
}