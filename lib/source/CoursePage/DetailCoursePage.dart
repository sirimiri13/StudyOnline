import 'package:flutter/material.dart';
import '../Struct/Course.dart';



final itemCourse = getCourseContinue();
class DetailCoursePage extends StatefulWidget{
  static String tag = 'detail-course-page';
  final Course dataCourse;
  DetailCoursePage({Key key, this.dataCourse}) : super(key: key);
  Course getDataCourse(){
    return dataCourse;
  }
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
                itemCount: 5 + itemCourse.length,
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
                              image: AssetImage('Assets/images/code4.jpg'),
                            )
                        )
                    );
                  else if (index == 1){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Text("Course's Name", style: TextStyle(fontSize: 20.0,color: Colors.indigo, fontWeight: FontWeight.bold)),
                    );
                  }
                  else if (index ==2){
                    return Container(
                         padding: EdgeInsets.all(5),
                         child: Text("Teacher's Name"),
                        );
                    }
                  else if (index == 3) {
                  return Container(
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
                              icon: Icon(Icons.assignment_turned_in_outlined,color: Colors.black54,size:30),
                            onPressed: (){},
                            ),
                            ),
                            Container(
                            child:  IconButton(icon: Icon(Icons.arrow_circle_down_rounded,color: Colors.black54,size:30),
                            onPressed: (){},
                            ),
                            ),
                      ]
                      ),
                     );
                   }
                  else if (index==4){
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Text('Video', style: TextStyle(fontSize: 20, color: Colors.indigo,fontWeight: FontWeight.bold)),
                    );
                  }
                  else {
                    return Container(
                      padding: EdgeInsets.all(2),
                      height: 100,
                      child: GestureDetector(
                          onTap: () {

                          },
                          child: Card(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset(itemCourse[index-5].image),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(itemCourse[index-5].name, style: TextStyle(fontWeight: FontWeight.bold)),
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