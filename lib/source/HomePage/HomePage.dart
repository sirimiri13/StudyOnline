import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
final List<String> imgList = [
  'Assets/images/code5.jpg', 'Assets/images/code6.jpg','Assets/images/code7.jpg','Assets/images/code8.jpg','Assets/images/code2.jpg'];
class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0, top: 10.0),
          child: ListView(
              children: <Widget>[
                suggestionHorizontalList,
                Text('Continue?', style: TextStyle(fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold)),
                horizontalList2,
                Text('My Courses',style: TextStyle(fontSize: 20.0, color: Colors.indigo, fontWeight: FontWeight.bold)),
              ]
          ),
        )
    );
  }

  Widget horizontalList2 = new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(

              width: 250.0,

              child: Column(
                  children: <Widget>[
                    Image.asset(
                        'Assets/images/code1.jpg', width: 250.0, height: 170.0),
                    Text('Tutorial Swift ep.2'),
                  ]
              )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset(
                        'Assets/images/code2.jpg', width: 250.0, height: 170.0),
                    Text('Tutorial Python'),
                  ]
              )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset(
                        'Assets/images/code3.jpg', width: 250.0, height: 170.0),
                    Text('Auto Layout '),
                  ]
              )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset(
                        'Assets/images/code5.jpg', width: 250.0, height: 170.0),
                    Text('Table View '),
                  ]
              )
          ),
        ],
      )
  );




  Widget suggestionHorizontalList = new Container(
    child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
        ),

        items: imgList.map((item) =>
            Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item,fit: BoxFit.cover, width:300.0),
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
                            child: Text(
                              'Flutter  ${imgList.indexOf(item)}',
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
  
}