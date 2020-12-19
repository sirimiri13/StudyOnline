
import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/source/Model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'DetailAccountPage.dart';
import 'EditAccountPage.dart';
import '../Model/User.dart';
import '../MainPage/MainPage.dart';
import '../LoginPage/LoginPage.dart';
import 'package:provider/provider.dart';
import '../../main.dart';


class AccountPage extends StatefulWidget {
  static String tag = 'account-page';
  @override
  _AccountPage createState() => new _AccountPage();
}

class _AccountPage extends State<AccountPage> {

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }


  @override
  Widget build(BuildContext context) {


    final profileRow = GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (_) => ChangeNotifierProvider.value(value: Provider.of<User>(context,listen: false),
                      child: DetailAccountPage())
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
                   //   color: AppColors.greyColor,
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
                    Icons.person,
                    size: 30,
                    color: Colors.indigo,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top:20),
                  child: Text(
                    'Profile',
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

    final manageInfo = GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  fullscreenDialog: true,
                builder: (_) => ChangeNotifierProvider.value(value: Provider.of<User>(context,listen: false),
                child: EditAccountPage())

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
                  padding: EdgeInsets.only(left: 20, top:20),
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
        onTap: (){
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
                  padding: EdgeInsets.only(left: 20, top:20),
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
        onTap: (){
          _save('0');
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
                  padding: EdgeInsets.only(left: 20, top:20),
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
            child: ListView(
              children: <Widget>[
                Consumer<User>(
                    builder: (context,user,child) => Container(
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AspectRatio(
                                aspectRatio: 1/1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      border: Border.all(
                                          color: Colors.grey,
                                          width: 1
                                      )
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      user.avatar,
                                    ),
                                  ),
                                )
                            ),

                            Container(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                user.name,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ]
                      ),
                    )
                ),
                profileRow,
                manageInfo,
                supportRow,
                logoutRow,
              ],
            ),
          )
      ),
    );
  }
}