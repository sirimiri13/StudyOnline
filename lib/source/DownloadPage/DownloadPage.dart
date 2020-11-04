import 'package:flutter/material.dart';

class DownloadPage extends StatefulWidget{
  static String tag = 'download-page';
  @override
  _DownloadPage createState() => new _DownloadPage();
}

class _DownloadPage extends State<DownloadPage> {
  final messText = Container(
    padding: EdgeInsets.only(top: 100.0),
    child: Center(
      child: Text('Search a course to download')
    )
  );
  List<int> a = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOWNLOAD'),
      ),
      body : ListView(children: _getListData()),
      );
  }
  _getListData() {
    List<Widget> widgets = [];
    if (a.isNotEmpty) {
      for (int i = 0; i < a.length; i++) {
        widgets.add(GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("hello"),
          ),
          onTap: () {
            print('row tapped $i');
          },
        ));
      }
    }
    else {
      widgets.add(
        messText,
      );
    }
    return widgets;
  }
}