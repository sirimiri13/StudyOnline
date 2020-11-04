import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPage createState() => new _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'computer',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('Assets/images/study.jpg'),
      ),
    );
    final emailTextField = TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordTextField = TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Enter your password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            //Navigator.of(context).pushNamed(HomePage.tag);
          },
          padding: EdgeInsets.all(12),
          color: Colors.indigo,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        )
    );
    final ForgotPasswordButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
      child: OutlineButton(
        onPressed: () {
        },
        disabledBorderColor: Colors.transparent,
        padding: EdgeInsets.all(12),
        borderSide: BorderSide.none,
        child: Text('Forget password?', style: TextStyle(color: Colors.indigo)),
      )
    );
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('LOGIN'),
          backgroundColor: Colors.indigo

        ),
        body: Center(
          child: Container (
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    logo,
                    SizedBox(height: 28.0),
                    emailTextField,
                    SizedBox(height: 8.0),
                    passwordTextField,
                    SizedBox(height: 8.0),
                    loginButton,
                    ForgotPasswordButton,
                  ]
              )
          )

          // child: Column(


            )
        );
    //);
  }
}