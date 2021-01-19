import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseSearch.dart';

import 'package:finalproject_1712061/source/CoursePage/InfomartionCoursePage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget{
  static String tag = 'search-page';
  @override
  _SearchPage createState() => new _SearchPage();
}



class _SearchPage extends State<SearchPage> {
  TextEditingController textController = new TextEditingController();
  List<SearchCourse> listSearchCourses;

  bool isLoaded = false;
  void _fetchData() async {
    setState(() {
      isLoaded = false;
    });
    listSearchCourses = await APIServer().fetchSearchCourses(textController.text);
    setState(() {
      isLoaded = true;
    });

  }
  @override void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: isLoaded? Stack(
          children: <Widget>[
            SafeArea(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: TextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (searchString) {
                              listSearchCourses.clear();
                              if (searchString != "") {
                                _fetchData();
                              }

                            },
                            decoration: InputDecoration(
                              hintText: 'Search',
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    textController.clear();
                                    listSearchCourses.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.indigo,
                                  )
                              ),
                              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.indigo,
                                  width: 1,
                                ),
                              ),
                            ),
                            cursorColor: Colors.indigo,
                            style: TextStyle(
                              color: Colors.indigo,
                            ),
                          )
                      ),
                      Expanded(
                          child: listSearchCourses == null ? Container() : Container(
                              child: listSearchCourses.length != 0 || textController.text.isNotEmpty ? new ListView.builder(
                                  itemCount: listSearchCourses.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => InformationCoursePage(id: listSearchCourses[index].id,))
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          height: 120,
                                          child: Card(
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    AspectRatio(
                                                      aspectRatio: 13/9,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(4),
                                                            bottomLeft: Radius.circular(4)
                                                        ),
                                                        child: Image.network(listSearchCourses[index].imageUrl),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            padding: EdgeInsets.all(5),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Text(listSearchCourses[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                                                listSearchCourses[index].description.length <= 100 ? Text(listSearchCourses[index].description, style: TextStyle(fontSize: 10)) : Text(listSearchCourses[index].description.substring(0,95) + "...", style: TextStyle(fontSize: 10)),
                                                                Text('Rated: ' + listSearchCourses[index].ratedNumber.toString(), style: TextStyle(fontSize: 10)),
                                                              ],
                                                            )
                                                        )
                                                    )
                                                  ]
                                              )
                                          )
                                      ),
                                    );
                                  }
                              ): ListView.builder(
                                  itemCount: listSearchCourses.length+1,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){

                                      },
                                      child: (index == 0) ? Container(
                                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                                        child: Text(
                                          'History',
                                          style: TextStyle(
                                              color: Colors.indigo,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ): Container(
                                          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                          height: 120,
                                          child: Card(
                                              child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    AspectRatio(
                                                      aspectRatio: 13/9,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(4),
                                                            bottomLeft: Radius.circular(4)
                                                        ),
                                                        child: Image.network(listSearchCourses[index].imageUrl),
                                                      ),
                                                    ),
                                                    Expanded(
                                                        child: Container(
                                                            padding: EdgeInsets.all(5),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: <Widget>[
                                                                Text(listSearchCourses[index].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                                                listSearchCourses[index].description.length <= 100 ? Text(listSearchCourses[index].description, style: TextStyle(fontSize: 10)) : Text(listSearchCourses[index].description.substring(0,95) + "...", style: TextStyle(fontSize: 10)),
                                                                Text('Rated: ' + listSearchCourses[index].ratedNumber.toString(), style: TextStyle(fontSize: 10)),
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
                                  }
                              )
                          )
                      )
                    ],
                  ),
                )
            ),

          ],
        ):
        new Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            Align(
              child: Container(
                width: 70.0,
                height: 70.0,
                child: new Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: new Center(
                        child: new CircularProgressIndicator()
                    )
                ),
              ),
              alignment: FractionalOffset.center,
            )
          ],
        )
    );
  }
}

