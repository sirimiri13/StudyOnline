//Main.dart
import 'package:flutter/material.dart';
import 'source/LoginPage/LoginPage.dart';
import 'source/MainPage/MainPage.dart';
import 'source/RegisterPage/RegisterPage.dart';
import 'source/BottomNavigation.dart';
import 'source/DownloadPage/DownloadPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MainPage.tag: (context) => MainPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    BottomNavigation.tag: (context) => BottomNavigation(),
    DownloadPage.tag: (context) => DownloadPage(),
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
