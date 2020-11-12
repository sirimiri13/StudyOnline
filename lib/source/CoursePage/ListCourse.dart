import 'package:flutter/material.dart';
import '../Struct/Course.dart';
import 'DetailCoursePage.dart';

final itemCourse = getCourseSuggest();
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
        itemCount: itemCourse.length,
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
                          Image.asset(itemCourse[index].image),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(itemCourse[index].name, style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Teacher: '+ itemCourse[index].teacher),
                                      Text('Total clip: '+ itemCourse[index].totalClip.toString()),
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