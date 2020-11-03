import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget{
static String tag = "account-manage-page";
@override
_BottomNavigation createState() => new _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation>{
  int _currentIndex = 0;


  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
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
            icon: Icon(Icons.youtube_searched_for),
          ),
          BottomNavigationBarItem(
            title: Text('Account'),
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
    );
  }
}