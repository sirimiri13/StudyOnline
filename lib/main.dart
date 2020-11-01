//Main.dart
import 'package:flutter/material.dart';
import 'View/LoginPage.dart';
import 'View/MainPage.dart';
import 'View/RegisterPage.dart';
import 'View/BottomNavigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    MainPage.tag: (context) => MainPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    BottomNavigation.tag: (context) => BottomNavigation(),
  };
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: BottomNavigation(),

      routes: routes,

    );
  }
}
