import 'package:finalproject_1712061/source/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../SearchPage/SearchPage.dart';
import '../Model/ListCourses.dart';
import '../CoursePage/DetailCoursePage.dart';
import '../../main.dart';
//final  _listDownload = [];
class DownloadPage extends StatefulWidget{
  static String tag = 'download-page';
  @override
  _DownloadPage createState() => new _DownloadPage();
}


class _DownloadPage extends State<DownloadPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ListCourses>(
        builder: (context,listCourses,child) =>
            Scaffold(
              appBar: AppBar(
                title: Text('DOWNLOADED'),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.indigo,
              ),
                body : ListView.builder(
                    itemCount: listCourses.listCourseDownloaded.length,
                    itemBuilder: (context,index){
                      return GestureDetector (
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailCoursePage()
                          ));
                        },
                        onLongPress:(){

                        },
                        child: Container(
                            padding: EdgeInsets.all(2),
                            height: 100,
                            child: Card(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset(listCourses.listCourseDownloaded[index].imageUrl,width: 125),
                                      Expanded(
                                          child: Container(
                                              padding: EdgeInsets.all(5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(listCourses.listCourseDownloaded[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                                  Text('Total Hours: '+listCourses.listCourseDownloaded[index].totalHours.toString()),
                                                  Text('Total clip: '+ listCourses.listCourseDownloaded[index].videoNumber.toString()),
                                                  // RatingBox(),
                                                ],
                                              )
                                          )
                                      )
                                    ]
                                )
                            )
                        ),
                      );
                     // else
                      // return Text('Nothing');
                      return Center(
                      child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text('No Download',style: TextStyle(color: Colors.indigo, fontSize: 20.0)),
                      )
                      );
                    }
                )
            )
    );
  }

}