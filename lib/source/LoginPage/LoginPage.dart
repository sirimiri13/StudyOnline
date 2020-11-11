import 'package:flutter/material.dart';
import '../BottomNavigation.dart';


TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

bool userNameValidate = false;
bool passWordValidate = false;
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
      controller : emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordTextField = TextField(
      controller : passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Enter your password',
        //  errorText: isUserNameValidate ? 'Please enter a Username' : null,
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
          //   if (passwordController.text.isEmpty|| emailController.text.isEmpty){
          //     return AlertDialog(
          //       title: new Text("Login Failed", style: TextStyle(color: Colors.indigo,fontSize: 20.0)),
          //       content: new Text("Username or Password is empty"),
          //       actions: <Widget>[
          //         // usually buttons at the bottom of the dialog
          //         new FlatButton(
          //           child: new Text("Try again",style: TextStyle(color: Colors.indigo,fontSize: 18.0)),
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //       ],
          //     );
          //   }
          // else {
              if (passwordController.text == emailController.text) {
                Navigator.of(context).pushNamed(BottomNavigation.tag);
              }
              else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Login Failed", style: TextStyle(
                          color: Colors.indigo, fontSize: 20.0)),
                      content: new Text(
                          "Username or Passsword is not corrected"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Try again", style: TextStyle(
                              color: Colors.indigo, fontSize: 18.0)),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
        //    }
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
        child: Text('Forget password?', style: TextStyle(color: Colors.indigo,decoration:TextDecoration.underline)),
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