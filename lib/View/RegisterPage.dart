import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget{
  static String tag = "register-page";
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    final lastNameTextField = TextField(
      decoration: InputDecoration(
        hintText: "Lam",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );

    final firstNameTextField = TextField(
      decoration: InputDecoration(
        hintText: "Huong",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final emailTextField = TextField(
      decoration: InputDecoration(
        hintText: "abc@abc.com",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final pwTextField = TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "********",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final confirmPwTextField = TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "********",
       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
      ),
    );
    final registerButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal:100.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
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
      body: Center(

        child: ListView(
            padding: EdgeInsets.only(left: 24.0, right: 24.0,),
          children: <Widget>[
            SizedBox(height: 10.0),
            Text('Last Name'),
            //SizedBox(height: 4.0),
            lastNameTextField,
            SizedBox(height: 6.0),
            Text('First Name'),
            //SizedBox(height: 4.0),
            firstNameTextField,
            SizedBox(height: 6.0),
            Text('Email'),
           // SizedBox(height: 4.0),
            emailTextField,
            SizedBox(height: 6.0),
            Text('Password'),
           // SizedBox(height: 4.0),
            pwTextField,
            SizedBox(height: 6.0),
            Text('Confirm Password'),
            SizedBox(height: 4.0),
            confirmPwTextField,
            SizedBox(height: 6.0),
            registerButton,
          ]
        )
      )
    );
  }

}