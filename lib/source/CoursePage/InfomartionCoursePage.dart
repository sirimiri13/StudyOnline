
import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class InformationCoursePage extends StatefulWidget{
  CourseInfo Courses;
  bool isLiked;
  bool isJoined;
  static String tag = 'list-course';
  InformationCoursePage({Key key, this.Courses,this.isLiked,this.isJoined}) : super(key: key);
  @override
  _InformationCoursePage createState() => new _InformationCoursePage();
}

var status = 0;
class _InformationCoursePage extends State<InformationCoursePage>{
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
                          http.Response  responseLike = await APIServer().getUserLikeCourse(widget.Courses.id);
                          status = responseLike.statusCode;
                        },
                        color: Colors.red,
                        child: (status == 200)?Text('Liked', style: TextStyle(color: Colors.white)):Text('Like', style: TextStyle(color: Colors.white)) ,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10,top:30,right:100),
                      height: 70,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        onPressed:() async {
                          http.Response response = await APIServer().getUserCourse(widget.Courses.id);
                          print(response.body);
                        },
                        color: Colors.indigo,
                        child: Text('Join', style: TextStyle(color: Colors.white)),
                      ),
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