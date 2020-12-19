import 'package:finalproject_1712061/source/Model/ListClip.dart';
import 'package:finalproject_1712061/source/Model/ListCourses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Course.dart';
import '../../main.dart';


//final itemCourse = getCourseSuggest();
class DetailCoursePage extends StatefulWidget{
  static String tag = 'detail-course-page';
  final Course dataCourse;

  //final Course dataCourse;
  DetailCoursePage({Key key, this.dataCourse}) : super(key: key);
  _DetailCoursePage createState() => new _DetailCoursePage();
  Course get getDataCourse => dataCourse;
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
                //itemCount: 5 + itemCourse.length,
              itemCount: widget.dataCourse.videoNumber + 7,
                itemBuilder: (context, index){
                  if (index ==0)
                    return Container(
                        padding: EdgeInsets.all(5.0),
                        width: MediaQuery.of(context).size.width/1.5,
                        height: MediaQuery.of(context).size.width/2,
                        decoration:BoxDecoration(
                            //border: Border.all(color: Colors.indigo, width: 5),
                          //  shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.dataCourse.promoVidUrl),
                            )
                        )
                    );
                  else if (index == 1){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Text(widget.dataCourse.title, style: TextStyle(fontSize: 20.0,color: Colors.indigo, fontWeight: FontWeight.bold)),
                    );
                  }
                  else if (index ==2){
                    return Container(
                         padding: EdgeInsets.all(5),
                         child: Text(widget.dataCourse.subtitle,style: TextStyle(fontWeight: FontWeight.bold)),
                        );
                    }
                  else if (index == 3){
                      return Container(
                      padding: EdgeInsets.all(5),
                      child: Text(widget.dataCourse.description),
                      );
                  }
                  else if (index == 4){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Total Hours: "+ widget.dataCourse.totalHours.toString()),
                    );
                  }
                  else if (index == 5) {
                  return Consumer<ListCourses>(
                    builder: (context,listCourses,child) =>
                    Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                            Container(
                            child:  IconButton(
                              icon: listCourses.myCourses.contains(widget.dataCourse)?Icon(Icons.assignment_turned_in,color: Colors.blue):Icon(Icons.add_to_photos,color: Colors.black54,size:30),
                            onPressed: (){
                              listCourses.myCourses.contains(widget.dataCourse)? listCourses.removeCourse(listCourses.myCourses, widget.dataCourse):
                              listCourses.addCourse(listCourses.myCourses, widget.dataCourse);
                            },
                            ),
                            ),
                            Container(
                            child:  IconButton(
                              icon:listCourses.listCourseDownloaded.contains(widget.dataCourse)?
                              Icon(Icons.delete_outline, color: Colors.red,) :
                              Icon(Icons.arrow_circle_down_rounded),
                            onPressed: (){
                              listCourses.listCourseDownloaded.contains(widget.dataCourse)? listCourses.removeCourse(listCourses.listCourseDownloaded, widget.dataCourse):
                              listCourses.addCourse(listCourses.listCourseDownloaded, widget.dataCourse);
                            },
                            ),
                            ),
                      ]
                      ),
                    )
                     );
                   }
                  else if (index==6){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Video', style: TextStyle(fontSize: 20, color: Colors.indigo,fontWeight: FontWeight.bold)),
                    );
                  }
                  else {
                    return
                    Container(
                      padding: EdgeInsets.all(2),
                      height: 100,
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Card(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(widget.dataCourse.promoVidUrl),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Chapter ${index-6}",style: TextStyle(fontWeight: FontWeight.bold)),
                                              //Text('Teacher: '+ itemCourse[index-6].teacher),
                                              //Text('Total clip: '+ itemCourse[index-6].totalClip.toString()),
                                              // RatingBox(),
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
                  }
            )
        )
    );

  }
}