
import 'package:finalproject_1712061/source/Model/User.dart';
import 'package:flutter/material.dart';
import '../Model/User.dart';
import '../MainPage/MainPage.dart';
import '../LoginPage/LoginPage.dart';
import 'package:provider/provider.dart';
import '../../main.dart';



TextEditingController editController = new TextEditingController();

class AccountPage extends StatefulWidget{
  static String tag = 'account-page';
  User user;

  @override
  _AccountPage createState() => new _AccountPage();
}

class _AccountPage extends State<AccountPage>{
  void _showDialog(String label,String hint) async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: label, hintText: hint),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              }),
          new FlatButton(
              child: const Text('DONE'),
              onPressed: () {
              })
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Container(
                child: Consumer<User>(
                  builder: (context, user, child)=>Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print('Tapped');
                        },
                        child: Container(
                            padding: EdgeInsets.all(5.0),
                            width: MediaQuery.of(context).size.width/1.5,
                            height: MediaQuery.of(context).size.width/1.5,
                            decoration:BoxDecoration(
                                border: Border.all(color: Colors.indigo, width: 5),
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(user.avatar),
                                  // read: lấy dữ liệu 1 lần
                                  // watch: lấy và luôn lắng nghe sự thay đổi
                                  // selector: lên đọc tài liệu, watch trên 1 property thay vì cả class

                                )
                            )
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text('First Name: ',style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 30.0),
                              //Text(_user.firstName),
                              Text(user.name),
                              Container(
                             child:  IconButton(icon: Icon(Icons.edit,color: Colors.black54,size:20),
                                onPressed: (){
                                  showDialog<String>(
                                    context: context,
                                    child: new AlertDialog(
                                      contentPadding: const EdgeInsets.all(16.0),
                                      content: new Row(
                                        children: <Widget>[
                                          new Expanded(

                                            child: new TextField(
                                              controller: editController,
                                              autofocus: true,
                                              decoration: new InputDecoration(
                                                  labelText: 'Edit', hintText:"_user.firstName"),
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        new FlatButton(
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        new FlatButton(
                                            child: const Text('DONE'),
                                            onPressed: () {
                                              user.editName(editController.text);
                                              Navigator.pop(context);

                                              //Navigator.pop(context);
                                            })
                                      ],
                                    ),
                                  );
                                },
                              ),
                              ),
                            ]
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text('Last Name: ',style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 30.0),
                             // Text(_user.lastName),
                              Text('abc'),
                              Container(
                                //padding: EdgeInsets.only(left: 60),
                              child: IconButton(icon: Icon(Icons.edit,color: Colors.black54,size:20),
                                onPressed: (){
                                  showDialog<String>(
                                    context: context,
                                    child: new AlertDialog(
                                      contentPadding: const EdgeInsets.all(16.0),
                                      content: new Row(
                                        children: <Widget>[
                                          new Expanded(

                                            child: new TextField(
                                              controller: editController,
                                              autofocus: true,
                                              decoration: new InputDecoration(
                                                  labelText: 'Edit', hintText:''),
                                            ),
                                          )
                                        ],
                                      ),
                                      actions: <Widget>[
                                        new FlatButton(
                                            child: const Text('CANCEL'),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        new FlatButton(
                                            child: const Text('DONE'),
                                            onPressed: () {
                                              // _user.lastName = editController.text;
                                              Navigator.pop(context);
                                            })
                                      ],
                                    ),
                                  );
                                },
                              ),
                              ),
                            ]
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text('Email: ',style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 65.0),
                              // Text(_user.email),
                              Text('email'),

                            ]
                        ),
                      ),

                      SizedBox(height: 30.0),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {
                              //Navigator.of(context).popAndPushNamed(MainPage.tag);
                            },
                            padding: EdgeInsets.all(12),
                            color: Colors.indigo,
                            child: Text('LOG OUT', style: TextStyle(color: Colors.white)),
                          )
                      ),
                    ]
                ),)

            )
        )
    );
  }
}