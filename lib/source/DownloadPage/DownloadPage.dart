
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadPage extends StatefulWidget{
  static String tag = 'download-page';
  @override
  _DownloadPage createState() => new _DownloadPage();
}


class _DownloadPage extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
   return
        Scaffold(
              appBar: AppBar(
                title: Text('DOWNLOADED'),
                automaticallyImplyLeading: false,
                backgroundColor: Colors.indigo,
              ),

        );

  }

}

