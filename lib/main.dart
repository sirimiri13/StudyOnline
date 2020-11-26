//Main.dart
import 'package:finalproject_1712061/source/AccountPage/AccountPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'source/LoginPage/LoginPage.dart';
import 'source/MainPage/MainPage.dart';
import 'source/RegisterPage/RegisterPage.dart';
import 'source/BottomNavigation.dart';
import 'source/DownloadPage/DownloadPage.dart';
import 'source/SearchPage/SearchPage.dart';
import 'source/HomePage/HomePage.dart';
import 'source/CoursePage/DetailCoursePage.dart';
import 'source/Model/Author.dart';
import 'source/Model/Clip.dart';
import 'source/Model/Course.dart';
import 'source/Model/User.dart';

List<Course> listCourse = new List<Course>();



void main() => runApp(
    ChangeNotifierProvider(
        create: (_) => new User(id: '0001',email:'lqh@123.com',avatar: 'Assets/images/profile.jpg',name: 'Lâm  Hương',favoriteCategories:[''],phone:'11111',type: 'Student',isDeleted: false,isActivated:true,createdAt: new DateTime(2020,04, 13) ,updatedAt: new DateTime(2020,04,13)),
        child: MyApp()
  ),
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
   createCourse(listCourse);
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
