import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/Category.dart';
import 'package:finalproject_1712061/Model/CourseSearch.dart';
import 'package:finalproject_1712061/Page/CoursePage/InfomartionCoursePage.dart';
import 'package:flutter/material.dart';


class ListCouresFromCategory extends StatefulWidget{
  String categoryID;
  ListCouresFromCategory({Key key, this.categoryID}) : super(key: key);
  @override
  _ListCouresFromCategory createState() => new _ListCouresFromCategory();
}



class _ListCouresFromCategory extends State<ListCouresFromCategory>{
  Category category;
  List<SearchCourse> listSearchCourses;
  bool isLoaded = false;
  void _fetchData() async {
    category = await APIServer().fetchCategoryWithID(widget.categoryID);
    listSearchCourses = await APIServer().fetchCoursesFromCategoryID(category.id);
    print(listSearchCourses[0].id);
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
    return Scaffold (
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Courses'),
        ),
        body: isLoaded? (listSearchCourses.length == 0 ? Container(
          child: Center (
            child: Text("No course"),
          ),
        ):ListView.builder (
                  itemCount: listSearchCourses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(2),
                      height: 100,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => InformationCoursePage(id: listSearchCourses[index].id)
                            )
                            );
                          },
                          child: Card(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.network(listSearchCourses[index].imageUrl,width: 125),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: <Widget>[
                                              Text(listSearchCourses[index].title, style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                              // Text(snap.data[index].subtitle),

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
              )):
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