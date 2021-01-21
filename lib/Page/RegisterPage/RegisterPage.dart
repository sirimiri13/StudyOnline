import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../LoginPage/LoginPage.dart';

class RegisterPage extends StatefulWidget{
  static String tag = "register-page";
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final usernameTextField = TextField(
      controller:  usernameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "username",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );

    final phoneNumberTextField = TextField(
      controller:  phoneNumberController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "01233456",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final emailTextField = TextField(
      controller:  emailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: "abc@abc.com",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final pwTextField = TextField(
      controller:  passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "********",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final registerButton = Container(
      width: 200.0,
      padding: EdgeInsets.all(20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async{
          var email = emailController.text;
          print(email);
          var pw = passwordController.text;
          var phone = phoneNumberController.text;
          var username = usernameController.text;
          http.Response response = await APIServer().register(username,email,phone,pw);
          print(response.body);
          if (response.statusCode == 200){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Resgiter", style: TextStyle(
                      color: Colors.indigo, fontSize: 18.0)),
                  content: Text("Successfull!"),
                  actions: <Widget>[
                    // usually buttons at the bottom of the dialog
                    new FlatButton(
                      child: new Text("OK", style: TextStyle(
                          color: Colors.indigo, fontSize: 16.0)),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, LoginPage.tag);
                      },
                    ),
                  ],
                );
              },
            );
          }
          else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // return object of type Dialog
                return AlertDialog(
                  title: new Text("Resgiter", style: TextStyle(
                      color: Colors.indigo, fontSize: 18.0)),
                  content: Text("Email or Phone number has been used"),
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

     },
        padding: EdgeInsets.all(20),
        color: Colors.indigo,
        child: Text('Register', style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
          onTap:() {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: <Widget>[
               Container (
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: SingleChildScrollView(
                        reverse: true,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              Text('Username'),
                              //SizedBox(height: 4.0),
                              usernameTextField,
                              SizedBox(height: 6.0),
                              Text('Email'),
                              //SizedBox(height: 4.0),
                              emailTextField,
                              SizedBox(height: 6.0),
                              Text('Phone Number'),
                              // SizedBox(height: 4.0),
                              phoneNumberTextField,
                              SizedBox(height: 6.0),
                              Text('Password'),
                              // SizedBox(height: 4.0),
                              pwTextField,
                              SizedBox(height: 6.0),
                              Center(
                                child: registerButton,
                              )

                            ]
                        ),
                      )
                  )
            ],
          )
      )
    );
  }

}