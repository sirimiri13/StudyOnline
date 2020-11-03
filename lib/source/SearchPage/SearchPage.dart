import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchPage extends StatefulWidget{
  static String tag = 'search-page';
  @override
  _SearchPage createState() => new _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
          ),
        ),
      ),
    );
  }
}