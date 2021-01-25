import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseSearch.dart';

import 'package:finalproject_1712061/Page/CoursePage/InfomartionCoursePage.dart';
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
      appBar: AppBar(
        title: Text('SEARCH'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
        body: isLoaded? Container(
          child: ListView (
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
                              hintText: 'Enter something ...',
                              suffixIcon: IconButton(
                                  onPressed: () async{
                                    textController.clear();
                                    listSearchCourses = await APIServer().fetchSearchCourses(textController.text);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.indigo,
                                  )
                              ),
                              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.indigo,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(

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
                                  itemCount: listSearchCourses.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: (){

                                      },
                                    child:Container(
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
        )
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
                color: Colors.white70,
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Center(
                            child: new CircularProgressIndicator()
                        )
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Loading ...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              alignment: FractionalOffset.center,
            )
          ],
        )
    );
  }
}

