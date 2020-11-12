import 'package:flutter/material.dart';
import '../CoursePage/DetailCoursePage.dart';
import '../CoursePage/ListCourse.dart';
import '../Struct/Course.dart';

final itemCourse = getCourseSuggest();


class InformationAuthor extends StatefulWidget{
  static String tag = 'information-author';
  @override
  _InformationAuthor createState() => new _InformationAuthor();
}


class _InformationAuthor extends State<InformationAuthor>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Author'),
      ),
     body: Container(
       child: ListView.builder(
         itemCount: 4 + itemCourse.length,
         itemBuilder: (context, index){
           if (index ==0 ) {
             return Container(
                 padding: EdgeInsets.all(5.0),
                 width: MediaQuery
                     .of(context)
                     .size
                     .width / 2,
                 height: MediaQuery
                     .of(context)
                     .size
                     .width / 2,
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.indigo, width: 1.0),
                     shape: BoxShape.circle,
                     color: Colors.white,
                     image: DecorationImage(
                       fit: BoxFit.cover,
                       image: AssetImage('Assets/images/profile.jpg'),
                     )
                 )
             );
           }
           else {
             if (index == 1) {
               return Container(
                 padding: EdgeInsets.all(10),
                 child: Center(
                   child: Text("Teacher's name", style: TextStyle(
                       color: Colors.indigo,
                       fontSize: 20,
                       fontWeight: FontWeight.bold)),
                 ),
               );
             }
             else {
               if (index == 2) {
                 return Container(
                   child: Text("Teacher's Information"),
                 );
               }
               else {
                 if (index == 3){
                   return Container(
                     child: Text("Courses", style: TextStyle(color: Colors.indigo,fontSize: 20.0,fontWeight: FontWeight.bold)),
                   );
                 }
                 else {
                   return Container(
                     padding: EdgeInsets.all(2),
                     height: 100,
                     child: GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(
                               builder: (context) => DetailCoursePage(dataCourse: itemCourse[index-4])
                           ));
                         },
                         child: Card(
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Image.asset(itemCourse[index-4].image),
                                 Expanded(
                                     child: Container(
                                         padding: EdgeInsets.all(5),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(itemCourse[index-4].name, style: TextStyle(fontWeight: FontWeight.bold)),
                                             Text('Teacher: '+ itemCourse[index-4].teacher),
                                             Text('Total clip: '+ itemCourse[index-4].totalClip.toString()),
                                             // RatingBox(),
                                           ],
                                         )
                                     )
                                 )
                               ]
                           ),
                         )
                     ),
                   );
                 }
               }
             }
           }

         }
       )
     )
   );
  }

}