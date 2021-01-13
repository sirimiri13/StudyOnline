import 'package:finalproject_1712061/Model/Course.dart';
import 'package:finalproject_1712061/Model/ListCourses.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget{
  static String tag = 'search-page';
  @override
  _SearchPage createState() => new _SearchPage();
}

TextEditingController searchEdit = TextEditingController();

class _SearchPage extends State<SearchPage> {
  List<Course> listCourses = ListCourses().listCourse;
  List<String> list = ListCourses().getTitle();
  var items = List<String>();
  @override
  void initState() {
    items.addAll(list);
    super.initState();
  }

  void filterData(String value) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(list);
    if (value.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(value)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(list);
      });
    }
  }


  @override

  Widget build(BuildContext context) {
    return new Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.indigo,
                  title: Text('Search'),
               ),
              body: Container(
                child: Column (
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child:TextField(
                        controller: searchEdit,
                       // autofocus: true,
                        decoration: InputDecoration(
                            labelText: "Search",
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                         onChanged: (value) {
                            filterData(value);
                          }
                      )
                     ),
                      Expanded(
                        child:ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            print(items.length);
                            return GestureDetector (
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (_) =>
                                //         ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                                //             child: DetailCoursePage(dataCourse: listCourses[index]))
                                // )
                                // );
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
                                            Image.asset(listCourses[index].imageUrl,width: 125),
                                            Expanded(
                                                child: Container(
                                                    padding: EdgeInsets.all(5),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(listCourses[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                                        Text('Total Hours: '+listCourses[index].totalHours.toString()),
                                                        Text('Total clip: '+ listCourses[index].videoNumber.toString()),
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
                          },
                        )
                      )

                  ]
                )
              )
            );
  }
}
