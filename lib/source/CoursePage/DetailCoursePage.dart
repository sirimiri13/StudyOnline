
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/source/CoursePage/LessonPage.dart';
import 'package:flutter/material.dart';




//final itemCourse = getCourseSuggest();
class DetailCoursePage extends StatefulWidget{
  static String tag = 'detail-course-page';
  CourseWithLesson course;
  DetailCoursePage({Key key, this.course}) : super(key: key);
  _DetailCoursePage createState() => new _DetailCoursePage();
}

//Course _dataCourse;
class _DetailCoursePage extends State<DetailCoursePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Detail Course'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 2 + widget.course.section.length ,
          itemBuilder: (contex,index){
            if (index == 0){
              return  Container(
                  padding: EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width/1.5,
                  height: MediaQuery.of(context).size.width/2,
                  decoration:BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.course.imageUrl),
                      )
                  )
              );
            }
            else if (index == 1){
              return  Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.course.title, style: TextStyle(fontSize: 20.0,color: Colors.indigo, fontWeight: FontWeight.bold)),
                      Text(widget.course.description,style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("Total Hours: "+ widget.course.totalHours.toString()),
                      Text('Section', style: TextStyle(fontSize: 20, color: Colors.indigo,fontWeight: FontWeight.bold)),
                    ],
                  )
              );
            }
            else {
              return Container(
                child : GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LessonPage(section: widget.course.section[index-2],videoURL: widget.course.promoVidUrl,))
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
                                        Text("Section ${index-1}: ${widget.course.section[index-2].name}",style: TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                )
                            )
                          ]
                      ),
                    )
                  )
              );

            }
          },
        )
      )

    );

  }
}