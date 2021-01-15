import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'DetailAccountPage.dart';
import 'EditAccountPage.dart';
import 'package:provider/provider.dart';


class AccountPage extends StatefulWidget {
  static String tag = 'account-page';
  @override
  _AccountPage createState() => new _AccountPage();
}


class _AccountPage extends State<AccountPage> {
  Future<UserMe> futureUserMe;
  @override initState(){
    super.initState();
    setState(() {
      futureUserMe = APIServer().fetchUserInfo();
    });

  }

  @override
  Widget build(BuildContext context) {

    final manageInfo = GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                    builder: (context) => EditAccountPage(futureUserMe)
                // builder: (context) => EditAccountPage(),
              )
          );
        },
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                      color: Colors.indigo,
                      // color: AppColors.greyColor,
                      width: 1,
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Manage',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
        )
    );

    final supportRow = GestureDetector(
        onTap: () {
          print('Clicked on Support');
        },
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                      color: Colors.indigo,
                      width: 3,
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.support,
                    size: 30,
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Support',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
        )
    );

    final logoutRow = GestureDetector(
        onTap: () {
          APIServer().save('0');
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                      color: Colors.indigo,
                      width: 1,
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.red,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    'Logout',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
        )
    );

    return Scaffold(
      body: SafeArea(
          child: Container(
              color: Colors.indigo,
              height: double.infinity,
              width: double.infinity,
              child: FutureBuilder<UserMe>(
                  future: futureUserMe,
                  builder: (context,snap) {
                    if (snap.hasData) {
                      return ListView(
                        children: <Widget>[
                          Container(
                              height: 120,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      bottom: BorderSide(
                                        color: Colors.indigo,
                                        width: 3,
                                      )
                                  )
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch,
                                  children: [
                                    AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  60),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1
                                              )
                                          ),
                                          child: ClipOval(
                                            child: Image.network(
                                              snap.data.payload.avatar,
                                            ),
                                          ),
                                        )
                                    ),

                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snap.data.payload.name.toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            snap.data.payload.email,
                                            style: TextStyle(
                                              fontSize: 15,fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            snap.data.payload.type,
                                            style: TextStyle(
                                              fontSize: 16
                                            ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ]
                              )
                          ),
                        //  profileRow,
                          manageInfo,
                          supportRow,
                          logoutRow,
                        ],
                      );
                    }
                    else if (snap.hasError){
                          print(snap.error);
                    }
                    return CircularProgressIndicator();
                  }

              )
          )
      ),
    );
  }
}