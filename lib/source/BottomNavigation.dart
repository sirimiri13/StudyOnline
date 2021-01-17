import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:flutter/material.dart';
import 'HomePage/HomePage.dart';
import 'DownloadPage/DownloadPage.dart';
import 'SearchPage/SearchPage.dart';
import 'AccountPage/AccountPage.dart';
import 'BrowsePage/BrowsePage.dart';


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
            child: _listPage[_currentIndex],
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
            setState(() {
              _currentIndex = value;
            });

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
