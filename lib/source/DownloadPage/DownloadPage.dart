import 'package:finalproject_1712061/source/BottomNavigation.dart';
import 'package:flutter/material.dart';
import '../SearchPage/SearchPage.dart';
import '../Struct/Course.dart';
import '../CoursePage/DetailCoursePage.dart';
final _listDownload = getCourseContinue();
//final  _listDownload = [];
class DownloadPage extends StatefulWidget{
  static String tag = 'download-page';
  @override
  _DownloadPage createState() => new _DownloadPage();
}



class _DownloadPage extends State<DownloadPage> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    print(_listDownload.length);
    if (_listDownload.isEmpty){
      _itemCount = 1;
    }
    return Scaffold(
      body : ListView.builder(
        itemCount: _listDownload.length + _itemCount,
        itemBuilder: (context,index){
          if (_listDownload.length != 0)
            return GestureDetector (
          onTap: () {
          Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailCoursePage()
          ));
          },
          child: Container(
                padding: EdgeInsets.all(2),
                height: 100,
                child: Card(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(_listDownload[index].image),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(_listDownload[index].name, style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Teacher: '+ _listDownload[index].teacher),
                                      Text('Total clip: '+ _listDownload[index].totalClip.toString()),
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
          else
           // return Text('Nothing');
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text('No Download',style: TextStyle(color: Colors.indigo, fontSize: 20.0)),
              )
            );
          }

      )
          );
  }

}