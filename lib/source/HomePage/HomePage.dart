import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Struct/Course.dart';
final List<String> imgList = [
  'Assets/images/code5.jpg', 'Assets/images/code6.jpg','Assets/images/code7.jpg','Assets/images/code8.jpg','Assets/images/code2.jpg'];

final itemCourseSuggest = getCourseSuggest();
final itemCourseContinue = getCourseContinue();
class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();
}


Widget continueHorizionList = new Container (
    child: CarouselSlider(
      options: CarouselOptions(),
      items: itemCourseContinue.map((item) => Container(
        height: 180,
        margin: EdgeInsets.all(5.0),
        child: Column(
            children: <Widget>[
              Image.asset(item.image,fit: BoxFit.cover, width:300.0,height: 160.0),
              Text(item.name,style: TextStyle(fontSize: 18.0))
            ]
        ),
      )).toList(),
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

      items: itemCourseSuggest.map((item) =>
          Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item.image,fit: BoxFit.cover, width:300.0),
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
                            child: Text(item.name,
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


class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(itemCourseSuggest.length);
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('HOME'),
        //   backgroundColor: Colors.indigo,
        // ),
        body: Container(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
         child: ListView.builder(
           scrollDirection: Axis.vertical,
          itemCount: itemCourseSuggest.length+4,
          itemBuilder: (context, index) {
             if (index == 0)
               return suggestionHorizontalList;
             else if (index == 1)
               return Text('Continue?', style: TextStyle(fontSize: 18.0,color: Colors.indigo,fontWeight: FontWeight.bold));
             else if (index == 2)
               return continueHorizionList;
             else if (index == 3)
               return Text('My Courses', style: TextStyle(fontSize: 18.0, color: Colors.indigo,fontWeight: FontWeight.bold));
             else
               return Container(
                   padding: EdgeInsets.all(2),
                   height: 100,
                   child: Card(
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           Image.asset(itemCourseSuggest[index-4].image),
                           Expanded(
                               child: Container(
                                   padding: EdgeInsets.all(5),
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: <Widget>[
                                       Text(itemCourseSuggest[index-4].name, style: TextStyle(fontWeight: FontWeight.bold)),
                                       Text('Teacher: '+ itemCourseSuggest[index-4].teacher),
                                       Text('Total clip: '+ itemCourseSuggest[index-4].totalClip.toString()),
                                       // RatingBox(),
                                     ],
                                   )
                               )
                           )
                         ]
                     ),
                   )
               );
          },


    )

    ),
    );
    }


 }