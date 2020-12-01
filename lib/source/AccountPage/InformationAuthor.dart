import 'package:finalproject_1712061/source/Model/Instructor.dart';
import 'package:finalproject_1712061/source/Model/ListCourses.dart';
import 'package:finalproject_1712061/source/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../CoursePage/DetailCoursePage.dart';
import '../CoursePage/ListCoursePage.dart';
import '../Model/Instructor.dart';
import '../../main.dart';
import '../Model/Course.dart';


class InformationAuthor extends StatefulWidget{
  static String tag = 'information-author';
  final Instructor dataInstructor;
  final List<Course> dataCourse;

  const InformationAuthor({Key key, this.dataInstructor, this.dataCourse}) : super(key: key);

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
          itemCount: 3 + widget.dataCourse.length,
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
                       image: AssetImage(widget.dataInstructor.avatar),
                     )
                 )
             );
           }
           else {
             if (index == 1) {
               return Container(
                 padding: EdgeInsets.all(10),
                 child: Center(
                   child: Text(widget.dataInstructor.name, style: TextStyle(
                       color: Colors.indigo,
                       fontSize: 20,
                       fontWeight: FontWeight.bold)),
                 ),
               );
             }
             else {
               if (index == 2) {
                 return Container(
                   padding: EdgeInsets.only(left: 10,bottom: 2),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Teacher's Information",style: TextStyle(fontWeight: FontWeight.bold),),
                       Text('- Email: '+widget.dataInstructor.email),
                       Text('- Phone: '+widget.dataInstructor.phone)
                     ],
                     )
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
                               builder: (_) =>
                                   ChangeNotifierProvider.value(value: Provider.of<ListCourses>(context,listen: false),
                                       child: DetailCoursePage(dataCourse: widget.dataCourse[index-4]))
                           )
                           );
                         },
                         child: Card(
                           child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: <Widget>[
                                 Image.asset(widget.dataCourse[index-4].imageUrl,width: 125,),
                                 Expanded(
                                     child: Container(
                                         padding: EdgeInsets.all(5),
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(widget.dataCourse[index-4].title, style: TextStyle(fontWeight: FontWeight.bold)),
                                             Text('Total hours: '+widget.dataCourse[index-4].totalHours.toString()),
                                             Text('Total clips: '+widget.dataCourse[index-4].videoNumber.toString()),
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