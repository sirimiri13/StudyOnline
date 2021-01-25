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
  UserMe user;
  bool isLoaded = false;
  void _fetchData() async {
    user = await APIServer().fetchUserInfo();
    setState(() {
      isLoaded = true;
    });
  }
  @override initState(){
    super.initState();
    _fetchData();

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: isLoaded? SafeArea(
            child: Container(
                color: Colors.indigo,
                height: double.infinity,
                width: double.infinity,
                child:ListView(
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
                                        user.payload.avatar,
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
                                        user.payload.name.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        user.payload.email,
                                        style: TextStyle(
                                            fontSize: 15,fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        user.payload.type,
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
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => EditAccountPage(user: user)
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
                                    Icons.app_registration,
                                    size: 30,
                                    color: Colors.indigo,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    'Edit Infomation',
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
                    ),
              GestureDetector(
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
                              'Sign Out',
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
              ),
                  ],
                )
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
                color: Colors.white70,
                width: 120,
                height: 120,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: new Center(
                            child: new CircularProgressIndicator()
                        )
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Loading ...",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              alignment: FractionalOffset.center,
            )
          ],
        )
    );
  }
}