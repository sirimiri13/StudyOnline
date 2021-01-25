import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:finalproject_1712061/Page/CoursePage/DetailCoursePage.dart';
import 'package:finalproject_1712061/Page/CoursePage/InfomartionCoursePage.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:finalproject_1712061/Model/Courses.dart';
import 'package:finalproject_1712061/Model/UserCourse.dart';
import 'package:finalproject_1712061/Model/FavoriteCourse.dart';
import 'package:finalproject_1712061/Page/CoursePage/ListFavoriteCoursePage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';



var lenghtCourseUser;
class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();

}


class _HomePage extends State<HomePage> {
  List<Courses> listCourseRecommend;
  List<UserCourse>  listUserCourse;
  List<FavoriteCourse> listFavoriteCourse;

  UserMe currentUser;
  bool isLoaded = false;
  void _fetchData() async {
    listCourseRecommend =  await APIServer().fetchTopSellCourses(10, 1);
    listUserCourse = await APIServer().fetchUserCourse();
    listFavoriteCourse = await  APIServer().fetchFavoriteCourse();
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

    return Scaffold(
      body: isLoaded ? Container(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                  child: CarouselSlider(
                            options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                            ),
                            items: listCourseRecommend.map((item) =>
                                GestureDetector(
                                    onTap: () async {
                                      CourseInfo courseInfo = await APIServer().getCourseInfo(item.id,null);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => InformationCoursePage(id: courseInfo.id,))
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 20),
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
                            ).toList(),
                   )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Favorite Course', style: TextStyle(fontSize: 18.0,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold)),
                  listFavoriteCourse.isEmpty? new Container ():
                  OutlineButton(
                    onPressed: () async {
                      Future<List<FavoriteCourse>> listFavoriteCourse = APIServer().fetchFavoriteCourse();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListFavoriteCoursePage(listCourse: listFavoriteCourse)),
                      );
                    },
                    disabledBorderColor: Colors.transparent,
                    padding: EdgeInsets.all(12),
                    borderSide: BorderSide.none,
                    child: listFavoriteCourse.length > 1 ?Text('More', style: TextStyle(color: Colors.indigo,decoration:TextDecoration.underline)): Container(),
                  )
                ],
              ),
              (listFavoriteCourse.isEmpty)? Container (
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                //    height: 100,
                child: Text(
                  "You haven't liked any course",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ):
              ((listFavoriteCourse.length > 1)?
               Container(
                        child: CarouselSlider(
                            options: CarouselOptions(),
                            items: listFavoriteCourse.map((item) =>
                                GestureDetector(
                                    onTap: () async {
                                      CourseInfo courseInfo = await APIServer().getCourseInfo(item.id,null);
                                      List<UserCourse> listCourse = await APIServer().fetchUserCourse();
                                      bool isJoined = listCourse.where((element) => element.id == courseInfo.id) != null? true: false;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => InformationCoursePage(id: courseInfo.id))
                                      );
                                    },
                                    child: Container(
                                      height: 200,
                                      margin: EdgeInsets.all(10.0),
                                      child: Column(
                                          children: <Widget>[
                                            Image.network(item.courseImage,
                                                fit: BoxFit.cover,
                                                width: 300.0,
                                                height: 160.0),
                                            Text(item.courseTitle,
                                                style: TextStyle(
                                                    fontSize: 18.0))
                                          ]
                                      ),
                                    )
                                ),
                            ).toList()
                        ),
                      ):
                  Container (
                    child: Column(
                        children: <Widget>[
                          Image.network(listFavoriteCourse[0].courseImage,
                              fit: BoxFit.cover,
                              width: 300.0,
                              height: 160.0),
                          Text(listFavoriteCourse[0].courseTitle,
                              style: TextStyle(
                                  fontSize: 18.0))
                        ]
                    ),
                  )
              ),

              Text('My Courses', style: TextStyle(fontSize: 18.0, color: Colors.indigo,fontWeight: FontWeight.bold)), 
              (listUserCourse.length == 0)? Container (
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        //    height: 100,
                        child: Text(
                         "Take the course!",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        ):
                      Container (
                          height: 120 * listUserCourse.length.toDouble(),
                          child: ListView.builder(
                               physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(top: 20),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: listUserCourse.length,
                              itemBuilder: (context, indexUserCourse) {
                                return  Card(
                                    child:  GestureDetector(
                                          onTap: () async {
                                       CourseWithLesson courseInfo = await APIServer().getCourseWithLession(listUserCourse[indexUserCourse].id);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => DetailCoursePage(course: courseInfo,))
                                        );
                                      },
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Image.network(listUserCourse[indexUserCourse].courseImage,width: 125),
                                            Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(listUserCourse[indexUserCourse].courseTitle, style: TextStyle(fontWeight: FontWeight.bold)),
                                                        Text('Author: ' + listUserCourse[indexUserCourse].instructorName),
                                                        Text('Videos: '+ listUserCourse[indexUserCourse].total.toInt().toString()),
                                                        //  RatingBox(),
                                                      ],
                                                    )
                                                )
                                            )
                                          ]
                                      ),
                                    )
                                );
                              })
                      ),

            ],
          )

      ):
      new Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(0, 0, 0, 0.2),
          ),
          Align(
            child: Container(
              color: Colors.white70,
              width: 120,
              height: 120,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new Center(
                          child: new CircularProgressIndicator()
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Loading ...",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.indigo,
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
            alignment: FractionalOffset.center,
          )
        ],
      )
    );
  }
}