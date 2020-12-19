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

class BottomNavigation extends StatefulWidget{
static String tag = 'bottom-navigation';
static String token;
@override
_BottomNavigation createState() => new _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation>{


  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  int _currentIndex = 0;
List<Widget> _listPage = <Widget>[
  HomePage(),
  BrowsePage(),
  DownloadPage(),
  SearchPage(),
  AccountPage(),
];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
              ChangeNotifierProvider<User>(create: (_) => new User(id: '0001',email:'lqh@123.com',avatar: 'Assets/images/profile.jpg',name: 'Lâm Quỳnh Hương',favoriteCategories:[''],phone:'11111',type: 'Student',isDeleted: false,isActivated:true,createdAt: new DateTime(2020,04, 13) ,updatedAt: new DateTime(2020,04,13))),
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
            print(value);
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
