
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class DownloadPage extends StatefulWidget{
  static String tag = 'download-page';
  @override
  _DownloadPage createState() => new _DownloadPage();
}


class _DownloadPage extends State<DownloadPage> {

  String appDirectory;
  List<FileSystemEntity> listVideoFiles = [];

  bool isLoaded = false;
  void listofFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    appDirectory = dir.path;
    setState(() {
      dir.list(recursive: false, followLinks: false)
          .listen((FileSystemEntity entity) {
        if (entity.path.substring(dir.path.length+1, entity.path.length) != ".Trash") {
          listVideoFiles.add(entity);
        }
      });
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    listofFiles();
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('DOWNLOAD'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
       body: isLoaded ? SafeArea(
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 Expanded(
                   child: listVideoFiles == null || listVideoFiles.length == 0 ? Container(
                     alignment: Alignment.center,
                     child: Text(
                       'No video download',
                       style: TextStyle(
                         fontSize: 18,
                         color: Colors.grey,
                       ),
                     ),
                   ): Container(
                       height: listVideoFiles.length.toDouble()*60,
                       child: ListView.builder(
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: listVideoFiles.length,
                         itemBuilder: (context, index) {
                           return Container(
                               child : GestureDetector(
                                   onTap: () {
                                     OpenFile.open(listVideoFiles[index].path);
                                   },
                                   child: Card(
                                     child: Container(
                                         padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(
                                                 listVideoFiles[index].path.substring(appDirectory.length + 1, listVideoFiles[index].path.length),
                                                 style: TextStyle(fontWeight: FontWeight.bold)),
                                           ],
                                         )
                                     ),
                                   )
                               )
                           );
                         },
                       )
                   ),
                 ),
               ],
             ),
           )
       ):
       new Stack(
         children: [
           Container(
             width: double.infinity,
             height: double.infinity,
             color: Color.fromRGBO(0, 0, 0, 0.2),
           ),
           Align(
             child: Container(
               width: 70.0,
               height: 70.0,
               child: new Padding(
                   padding: const EdgeInsets.all(5.0),
                   child: new Center(
                       child: new CircularProgressIndicator()
                   )
               ),
             ),
             alignment: FractionalOffset.center,
           )
         ],
       )
   );
  }

}

