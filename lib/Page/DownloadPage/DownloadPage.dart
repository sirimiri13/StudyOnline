
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

  String folderDirectory;
  List<FileSystemEntity> listVideo = [];
  String endPath = ".mov";


  bool isLoaded = false;
  void getListFile() async {
    final  directory = await getApplicationDocumentsDirectory();
    folderDirectory = directory.path;
    setState(() {
      directory.list(recursive: false, followLinks: false)
          .listen((FileSystemEntity entity) {
        if (entity.path.substring(directory.path.length+1, entity.path.length) != ".Trash") {
          listVideo.add(entity);
        }
      });
      isLoaded = true;
    });
  }




  @override
  void initState() {
    super.initState();
    getListFile();
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
                   child: listVideo == null || listVideo.length == 0 ? Container(
                     alignment: Alignment.center,
                     child: Text(
                       'No video download',
                       style: TextStyle(
                         fontSize: 18,
                         color: Colors.grey,
                       ),
                     ),
                   ): Container(
                       height: listVideo.length.toDouble()*60,
                       child: ListView.builder(
                         physics: const NeverScrollableScrollPhysics(),
                         itemCount: listVideo.length,
                         itemBuilder: (context, index) {
                           return Container(
                             height: 50,
                               child : GestureDetector(
                                   onTap: () {
                                     OpenFile.open(listVideo[index].path);
                                     print(listVideo[index]);
                                   },
                                     child: Container(
                                         padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(
                                                // listVideo[index].path.substring(folderDirectory.length + 1, listVideo[index].path.length),
                                                 listVideo[index].path.substring(folderDirectory.length + 1, listVideo[index].path.indexOf(endPath)),
                                                 style: TextStyle(fontWeight: FontWeight.bold)),
                                           ],
                                         )
                                     ),
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

