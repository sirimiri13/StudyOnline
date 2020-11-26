import 'package:flutter/material.dart';
import '../Model/Course.dart';
import 'DetailCoursePage.dart';
import '../../main.dart';

//final itemCourse = getCourseSuggest();
class ListCourse extends StatefulWidget{
  static String tag = 'list-course';
  @override
  _ListCourse createState() => new _ListCourse();
}


class _ListCourse extends State<ListCourse>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Courses'),
      ),
      body: ListView.builder(
        //itemCount: itemCourse.length,
        itemCount: 1,
        itemBuilder: (context, index){

            return  Container(
              padding: EdgeInsets.all(2),
              height: 100,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DetailCoursePage()
                    ));
                  },
                  child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(listCourse[index].promoVidUrl),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(listCourse[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Teacher: '),
                                      Text('Total clip: '),
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
      )

    );
  }

}