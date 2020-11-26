import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';
import '../Model/Course.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Model/Author.dart';
import '../CoursePage/ListCourse.dart';
import '../AccountPage/InformationAuthor.dart';
import '../../main.dart';


//final itemCourseSuggest = getCourseSuggest();
final _listSkill = ['C++','Swift','Python', 'Flutter', 'ASP.NET Core','TypeScript','Machine Learning','JavaScript'];
//final _listAuthor = getListAuthor();
class BrowsePage extends StatefulWidget{
  static String tag = 'browse-page';
  @override _BrowsePage createState() => new _BrowsePage();
}



class _BrowsePage extends State<BrowsePage>{
  Widget themeCourse = new Container (
    child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),

        items: listCourse.map((item) =>
            Container(
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(item.promoVidUrl,fit: BoxFit.cover, width:350.0),
                          //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Text(item.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                )
            )).toList()
    ),
  );
  _getListSkill(){
    List<Widget> widgets = [];
    if (_listSkill.isNotEmpty){
      for (int i =0; i < _listSkill.length; i++) {
        widgets.add(GestureDetector(
          child: FlatButton(
            color: Colors.black12,
            onPressed: (){
            },
            child: Text(_listSkill[i]),
          ),

        ),
        );
      }
    }
    return widgets;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only( top: 10.0),
        child: ListView.builder  (
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ImageButton(
                      children: <Widget>[
                        Text('NEW COURSES', style: TextStyle(
                            color: Colors.white, fontSize: 30.0)),
                      ],
                      width: double.infinity,
                      height: 200,
                      paddingTop: 5,
                      pressedImage: Image.asset(
                        "Assets/images/code8.jpg",
                      ),
                      unpressedImage: Image.asset(
                        "Assets/images/code8.jpg",),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ListCourse()
                        ));
                      },
                    )
                );
              }
              else if (index == 1) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  child: ImageButton(

                    children: <Widget>[
                      Text('FOR YOU', style: TextStyle(
                          color: Colors.white, fontSize: 30.0)),
                    ],
                    width: double.infinity,
                    height: 200,
                    paddingTop: 5,
                    pressedImage: Image.asset(
                      "Assets/images/code8.jpg",
                    ),
                    unpressedImage: Image.asset(
                      "Assets/images/code3.jpg",),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ListCourse()
                      ));
                    },
                  ),
                );
              }
              else if (index == 2) {
                return Container(
                  padding: EdgeInsets.only(left: 10.0),
                  margin: EdgeInsets.all(5.0),
                  child: Text('TOPIC', style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
                );
              }
              else if (index == 3) {
                return  Container (
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ListCourse()
                      ));
                    },
                    child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),

                        items: listCourse.map((item) =>
                            Container(
                                child: Container(
                                  margin: EdgeInsets.all(2.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset(item.promoVidUrl,fit: BoxFit.cover, width:350.0),
                                          //  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              child: Text(item.title,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                )
                            )).toList()
                    ),
                  ),
                );
              }
              else if (index == 4) {
                return Container(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Text('Skills', style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
                );
              }
              else {
                if (index == 5) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 9.0, vertical: 7.0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.08,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listSkill.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.4,
                            child: Card(
                              color: Colors.black12,
                              child: Container(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ListCourse()
                                    ));
                                  },
                                  child: Center(
                                      child: Text(_listSkill[index],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),)),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  );
                }
                else {
                  if (index == 6) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Text(
                          'Top Author', style: TextStyle(color: Colors
                          .indigo, fontSize: 25.0, fontWeight: FontWeight
                          .bold)),
                    );
                  }
                  else {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 18.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, indexAuthor) {
                            return Container(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Card(
                                // color: Colors.transparent
                                //color: Colors.black12,
                                  child: Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => InformationAuthor()
                                        ));
                                      },
                                      child: Center(
                                          child: Column(
                                              children: <Widget>[
                                                CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage: AssetImage("Assets/images/profile-2.jpg"),
                                                ),
                                                Text("ABC", style: TextStyle(fontSize: 11.0)),
                                              ]
                                          )
                                      ),
                                    ),
                                  )
                              ),
                            );
                          }
                      ),
                    );
                  }
                }
              }
            }
        ),
      ),
    );
  }

}