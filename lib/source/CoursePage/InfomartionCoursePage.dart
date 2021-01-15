
import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:finalproject_1712061/Model/FavoriteCourse.dart';
import 'package:finalproject_1712061/Model/UserCourse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class InformationCoursePage extends StatefulWidget{
  CourseInfo Courses;
  static String tag = 'list-course';
  InformationCoursePage({Key key, this.Courses}) : super(key: key);
  @override
  _InformationCoursePage createState() => new _InformationCoursePage();
}

class _InformationCoursePage extends State<InformationCoursePage>{
  List<FavoriteCourse> listCourseFavorite;
  List<UserCourse> listCourse;
  bool isLike;
  bool isJoin;
  void checkStatus() async{
    listCourseFavorite = await APIServer().fetchFavoriteCourse();
    listCourse = await APIServer().fetchUserCourse();
    print("favorite ${listCourseFavorite}");
    print("couser ${listCourse}");

    print("like ${isLike}" );
    print("join ${isJoin}" );

    setState(() {
      isLike = listCourseFavorite.where((element) => element.id == widget.Courses.id).toList().length == 0 ? false : true;
      isJoin = listCourse.where((element) => element.id == widget.Courses.id).toList().length == 0 ? false : true;
    });
  }

  @override void initState(){
    super.initState();
    checkStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Detail Course'),
        ),
        body: Container(
            child: ListView(
              children: [
                Container(
                    padding: EdgeInsets.all(5.0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.5,
                    height: MediaQuery
                        .of(context)
                        .size
                        .width / 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.Courses.imageUrl),
                        )
                    )
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,top:5,right:10),
                  child: Text(widget.Courses.title, style: TextStyle(fontSize: 20.0,color: Colors.indigo, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,top:5,right:10),
                  child: Text(widget.Courses.subtitle,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.indigo)),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10,top:5,right:10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Description: ",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.Courses.description),
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.only(left: 10,top:5,right:10),
                    child: Row(
                      children: [
                        Text("Total Hours: ",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.Courses.totalHours.toString())
                      ],
                    )

                ),
                Container(
                    padding: EdgeInsets.only(left: 10,top:5,right:10),
                    child: Row(
                      children: [
                        Text("Price: ",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.Courses.price == 0.0 ? "Free": widget.Courses.price.toString() )
                      ],
                    )
                ),
                Container(
                    padding: EdgeInsets.only(left: 10,top:5,right:10),
                    child: Row(
                      children: [
                        Text("Rate: ",style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(widget.Courses.ratedNumber.toString())
                      ],
                    )
                ),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 100,top:30,right:10),
                      height: 70,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        onPressed:() async {
                          if (isLike == false){
                            http.Response responseLike = await APIServer().getUserLikeCourse(widget.Courses.id);
                            if (responseLike.statusCode == 200){
                              setState(() {
                                isLike = true;
                              });
                            }
                          }
                        },
                        color: Colors.red,
                        child: (isLike != null) ? (isLike ? Text('Liked', style: TextStyle(color: Colors.white)): Text('Like', style: TextStyle(color: Colors.white))):Text("Like", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top:30,right:100),
                      height: 70,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        onPressed:() async {
                          http.Response response = await APIServer().getJoinCourse(widget.Courses.id);
                          if (response.statusCode == 200){
                            setState(() {
                              isJoin = true;
                            });
                          }
                        },
                        color: Colors.indigo,
                        child: (isJoin != null) ? (isJoin ? Text('Joined', style: TextStyle(color: Colors.white)): Text('Join', style: TextStyle(color: Colors.white))):Text("Join", style: TextStyle(color: Colors.white))),
                      ),
                  ],
                ),
              ],
            )
        )
    );
  }
//

}