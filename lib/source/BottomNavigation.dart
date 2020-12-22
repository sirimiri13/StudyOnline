import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:finalproject_1712061/source/Model/ListClip.dart';
import 'package:finalproject_1712061/source/Model/ListInstructor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomePage/HomePage.dart';
import 'DownloadPage/DownloadPage.dart';
import 'SearchPage/SearchPage.dart';
import 'AccountPage/AccountPage.dart';
import 'BrowsePage/BrowsePage.dart';
import 'Model/User.dart';
import 'Model/ListCourses.dart';
import 'Model/Clip.dart';

UserMe user = UserMe();
class BottomNavigation extends StatefulWidget{
  static String tag = 'bottom-navigation';
  @override
  _BottomNavigation createState() => new _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation>{

  int _currentIndex = 0;
List<Widget> _listPage = <Widget>[
  HomePage(),
  BrowsePage(),
  DownloadPage(),
  SearchPage(),
  AccountPage(),
];

  fetchData() async {
    UserMe userRes;
    userRes = await APIServer().fetchUserInfo();
    setState(() {
      user = userRes;
    });
    return userRes;
  }

  @override initState(){
    super.initState();
    fetchData();
  }
  Widget build(BuildContext context) {


    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return WillPopScope(
       onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider<UserMe>(create: (context) => user),
              ChangeNotifierProvider<ListCourses>(create: (context) => ListCourses()),
              ChangeNotifierProvider<ListClip>(create: (context)=> ListClip()),
              ChangeNotifierProvider<ListInstructor>(create: (context) => ListInstructor())
            ],
            child: _listPage[_currentIndex],
          )

        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            setState(() => _currentIndex = value);
           // fetchData();
            //print(value);
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.water_damage),
            ),
            BottomNavigationBarItem(
              title: Text('Browse'),
              icon: Icon(Icons.wysiwyg_sharp),
            ),
            BottomNavigationBarItem(
              title: Text('Download'),
              icon: Icon(Icons.arrow_circle_down_rounded),
            ),
            BottomNavigationBarItem(
              title: Text('Search'),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              title: Text('Account'),
              icon: Icon(Icons.account_circle_rounded),
            ),
          ],
        ),
      )
      );

  }
}
