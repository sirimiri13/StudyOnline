//Main.dart
import 'package:finalproject_1712061/Page/AccountPage/AccountPage.dart';
import 'package:flutter/material.dart';
import 'Page/LoginPage/LoginPage.dart';
import 'Page/MainPage/MainPage.dart';
import 'Page/RegisterPage/RegisterPage.dart';
import 'Page/BottomNavigation.dart';
import 'Page/DownloadPage/DownloadPage.dart';
import 'Page/SearchPage/SearchPage.dart';
import 'Page/HomePage/HomePage.dart';
import 'Page/CoursePage/DetailCoursePage.dart';




void main() => runApp(

  MyApp(),
);


class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MainPage.tag: (context) => MainPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    BottomNavigation.tag: (context) => BottomNavigation(),
    DownloadPage.tag: (context) => DownloadPage(),
    SearchPage.tag: (context) => SearchPage(),
    HomePage.tag: (context) => HomePage(),
    AccountPage.tag: (context) => AccountPage(),
    DetailCoursePage.tag: (context) => DetailCoursePage(),

  };

  @override
  Widget build(BuildContext context) {
   //createCourse(listCourse);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MainPage(),
      routes: routes,
    );
  }
}
