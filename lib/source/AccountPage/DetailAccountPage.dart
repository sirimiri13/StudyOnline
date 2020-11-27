import 'package:finalproject_1712061/source/Model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class DetailAccountPage extends StatefulWidget {
  static String tag = 'detail-account-page';

  @override
  _DetailAccountPage createState() => new _DetailAccountPage();
}

class _DetailAccountPage extends State<DetailAccountPage> {
  @override
  Widget build(BuildContext context) {

    final avatarImage = AspectRatio(
      aspectRatio: 1/1,
      child: ClipOval(
          child: Container(
            color: Colors.indigo,
            child: Image.asset(
              'Assets/images/profile-2.jpg',
            ),
          )
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        print('Tapped Avatar');
                      },
                    child: Consumer<User>(
                     builder: (context,user,child)=>Column(
                       children: [
                         Container(
                             padding: EdgeInsets.all(10.0),
                             width: MediaQuery.of(context).size.width/2,
                             height: MediaQuery.of(context).size.width/2,
                             decoration:BoxDecoration(
                                 border: Border.all(color: Colors.indigo, width: 4),
                                 shape: BoxShape.circle,
                                 color: Colors.white,
                                 image: DecorationImage(
                                   fit: BoxFit.fitWidth,
                                   image: AssetImage(user.avatar),
                                   // read: lấy dữ liệu 1 lần
                                   // watch: lấy và luôn lắng nghe sự thay đổi
                                   // selector: lên đọc tài liệu, watch trên 1 property thay vì cả class

                                 )
                             )
                         ),
                    Column(
                        children : [
                          Container(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Text(
                              user.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            user.type,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black45,
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            height: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'DOWNLOADED',
                                        style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(user.favoriteCategories.length.toString())
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'COURSES',
                                        style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(user.favoriteCategories.length.toString())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]
                    ),
                  ]
            )
        )
    )
                       ],
                     )


        )
    );
  }
}