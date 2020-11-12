//Main.dart
import 'package:finalproject_1712061/source/AccountPage/AccountPage.dart';
import 'package:flutter/material.dart';
import 'source/LoginPage/LoginPage.dart';
import 'source/MainPage/MainPage.dart';
import 'source/RegisterPage/RegisterPage.dart';
import 'source/BottomNavigation.dart';
import 'source/DownloadPage/DownloadPage.dart';
import 'source/SearchPage/SearchPage.dart';
import 'source/HomePage/HomePage.dart';
import 'source/CoursePage/DetailCoursePage.dart';

void main() => runApp(MyApp());

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
