
import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/API/SignInGG.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../BottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



bool userNameValidate = false;
bool passWordValidate = false;
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPage createState() => new _LoginPage();

}

class _LoginPage extends State<LoginPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailForgetPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final logo = Hero(
      tag: 'computer',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('Assets/images/study.jpg'),
      ),
    );
    final emailTextField = TextField(
      textInputAction: TextInputAction.next,
      onEditingComplete: () => node.nextFocus(),
      controller : emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordTextField = TextField(
      textInputAction: TextInputAction.done,
      onEditingComplete: () => node.nextFocus(),
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

    final loginButton = Container (
      width: 200,

        padding: EdgeInsets.all(20),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () async{
            var email = emailController.text;
            var pw = passwordController.text;
            http.Response response = await APIServer().login(email, pw);
           // http.Response response = await APIServer().login("barobaro2406@gmail.com", "Qwerty1234");
              if (response.statusCode == 200) {
                Navigator.of(context).pushNamed(BottomNavigation.tag);
              }
              else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text("Login Failed", style: TextStyle(
                          color: Colors.indigo, fontSize: 18.0)),
                      content: new Text(
                        "Username or Password is wrong!"
                      ),
                    actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("Try again", style: TextStyle(
                              color: Colors.indigo, fontSize: 16.0)),
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
    final ForgotPasswordButton = Container(
      width: 200,
      padding: EdgeInsets.all(20),
      child: OutlineButton(
        onPressed: () {
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            titleTextStyle : TextStyle(color: Colors.indigo),
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                  child: new TextField(
                    controller: emailForgetPassController,
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Forget Password',
                        hintText: 'email',
                        labelStyle: TextStyle(color: Colors.indigo)
                  ),
                )
                )
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('CANCEL',style: TextStyle(color: Colors.indigo)),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('DONE',style: TextStyle(color: Colors.indigo)),
                  onPressed: () async {
                    var email = emailForgetPassController.text;
                    http.Response response = await APIServer().forgetPassword(email);
                    if (response.statusCode == 200){
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Confirm", style: TextStyle(
                                  color: Colors.indigo, fontSize: 18.0)),
                              content: new Text("Please check your email"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("OK", style: TextStyle(
                                      color: Colors.indigo, fontSize: 16.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }
                    else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Failed", style: TextStyle(
                                  color: Colors.indigo, fontSize: 18.0)),
                              content: new Text("Email does not existed"),
                              actions: <Widget>[
                                // usually buttons at the bottom of the dialog
                                new FlatButton(
                                  child: new Text("Try Again", style: TextStyle(
                                      color: Colors.indigo, fontSize: 16.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          }
                      );
                    }
               //     Navigator.pop(context);
                  },
                  )
            ],
          );
        },
          );
        },
        disabledBorderColor: Colors.transparent,
        padding: EdgeInsets.all(12),
        borderSide: BorderSide.none,
        child: Text('Forget password?', style: TextStyle(color: Colors.indigo,decoration:TextDecoration.underline)),
      )
    );
    final signInGoogleButton = Container(
        width: 200,
        padding: EdgeInsets.all(20),
        child: OutlineButton(
          onPressed: () {
            SignInGG().signInWithGoogle().whenComplete(() {
              Navigator.of(context).pushNamed(BottomNavigation.tag);
            });
          },
          disabledBorderColor: Colors.transparent,
          padding: EdgeInsets.all(12),
          borderSide: BorderSide.none,
          child: Text('Sign In With Google', style: TextStyle(color: Colors.indigo)),
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
              padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    logo,
                    SizedBox(height: 20.0),
                    emailTextField,
                    SizedBox(height: 8.0),
                    passwordTextField,
                    SizedBox(height: 8.0),
                    loginButton,
                    ForgotPasswordButton,
                    signInGoogleButton,
                  ]
              )
          )

          // child: Column(


            )
        );
    //);
  }
}