import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME'),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            padding: EdgeInsets.only(left:10.0,top: 10.0),
            child: ListView(
                children: <Widget>[
                  suggestionHorizontalList,
                  Text('Continue?', style: TextStyle(fontSize: 20.0,color: Colors.indigo, fontWeight: FontWeight.bold)),
                 horizontalList2,
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
                Image.asset('Assets/images/code1.jpg',width: 250.0,height: 160.0),
                Text('Tutorial Swift ep.2'),
              ]
            )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset('Assets/images/code2.jpg',width: 250.0,height: 160.0),
                    Text('Tutorial Python'),
                  ]
              )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset('Assets/images/code3.jpg',width: 250.0,height: 160.0),
                    Text('Auto Layout '),
                  ]
              )
          ),
          Container(
              width: 250.0,
              child: Column(
                  children: <Widget>[
                    Image.asset('Assets/images/code5.jpg',width: 250.0,height: 160.0),
                    Text('Table View '),
                  ]
              )
          ),
        ],
      )
  );
  Widget  suggestionHorizontalList = new Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

            Image.asset('Assets/images/code6.jpg',width:350.0),
            Image.asset('Assets/images/code7.jpg',width:350.0),
            Image.asset('Assets/images/code8.jpg',width:350.0),
          ]
      )
  );
}