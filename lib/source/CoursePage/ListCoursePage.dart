import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/Course.dart';
import 'DetailCoursePage.dart';
import '../Model/ListCourses.dart';
import '../../main.dart';

//final itemCourse = getCourseSuggest();
class ListCoursePage extends StatefulWidget{
  static String tag = 'list-course';
  final List<Course> dataCourse;
  ListCoursePage({Key key, this.dataCourse}) : super(key: key);
  @override
  _ListCoursePage createState() => new _ListCoursePage();
}


class _ListCoursePage extends State<ListCoursePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Courses'),
      ),
      body: Consumer<ListCourses>(
        builder: (context,listCourses,child) =>
        ListView.builder(
        //itemCount: itemCourse.length,
        itemCount: widget.dataCourse.length,
        itemBuilder: (context, index){
            return  Container(
              padding: EdgeInsets.all(2),
              height: 100,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) =>
                            ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                                child:(DetailCoursePage(dataCourse: widget.dataCourse[index])))
                    )
                    );
                  },
                  child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(widget.dataCourse[index].promoVidUrl,width: 125),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(widget.dataCourse[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Total clip: '+widget.dataCourse[index].videoNumber.toString()),
                                      Text('Hour: '+widget.dataCourse[index].videoNumber.toString()),
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
      )

    );
  }

}