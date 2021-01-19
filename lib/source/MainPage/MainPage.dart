import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:finalproject_1712061/source/BottomNavigation.dart';
import 'package:flutter/material.dart';
import '../LoginPage/LoginPage.dart';
import '../RegisterPage/RegisterPage.dart';
import '../../main.dart';



class MainPage extends StatefulWidget {
  static String tag = 'main-page';
  @override
  _MainPage createState() => new _MainPage();
}

class _MainPage extends State<MainPage> {

  bool isLoaded = false;
  checkToken() async {
    UserMe currentUser = await APIServer().fetchUserInfo();
    if (currentUser != null) {
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new BottomNavigation(),
          )
      );
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override void initState() {
    super.initState();
    checkToken();
  }
  @override
  Widget build(BuildContext context) {
    final loginButton = Container(
        width: 200,
        padding:EdgeInsets.only(left:10,top: 50,right:10,bottom:10),
     // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
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
    final SignUpButton = Container(
       width: 200,
     // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
      padding:EdgeInsets.all(10),
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

    final WelcomeLabel = Container(

      child:Text(
          "WELCOME!",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.indigo,
            inherit: false,
          )
      )
    ) ;

    return isLoaded? Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                WelcomeLabel,
                loginButton,
                SignUpButton,
              ]
          )
      )

      ):
    new Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.2),
        ),
        Align(
          child: Container(
            width: 70.0,
            height: 70.0,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(
                    child: new CircularProgressIndicator()
                )
            ),
          ),
          alignment: FractionalOffset.center,
        )
      ],
    );
  }
}