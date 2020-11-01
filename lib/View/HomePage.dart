import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
        padding: EdgeInsets.all(20),
        color: Colors.indigo,
        child: Text('Sign In', style: TextStyle(color: Colors.white)),
      )
    );
    final SignUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: (){
          Navigator.of(context).pushNamed(RegisterPage.tag);
        },
        padding: EdgeInsets.all(20),
        child: Text('Sign Up',style: TextStyle(color: Colors.indigo)),
      )
    );

    final WelcomeLabel = Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 127.0),
      child: Text(
        "WELCOME!",
        style: TextStyle(
          fontSize: 30.0,
          color: Colors.indigo,
          inherit: false,
        )
      )
    );
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('Assets/images/background.jpg'),
            fit: BoxFit.cover
          ),
      ),
      padding: EdgeInsets.only(top: 250.0),
      child: Center (
          child: ListView(
              children: <Widget>[
                WelcomeLabel,
                loginButton,
                SignUpButton,
              ]
          )
      )

      );
  }
}