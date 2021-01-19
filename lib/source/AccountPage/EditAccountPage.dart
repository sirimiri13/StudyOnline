import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:finalproject_1712061/source/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class EditAccountPage extends StatefulWidget{
  static String tag = 'edit-account-page';
  UserMe user;
  EditAccountPage({this.user});
  @override
  _EditAccountPage createState() => new _EditAccountPage();
}

class _EditAccountPage extends State<EditAccountPage>{
  TextEditingController editNameController = new TextEditingController();
  TextEditingController oldPwController = new TextEditingController();
  TextEditingController newPwController = new TextEditingController();
  TextEditingController editPhoneController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EDIT'),
          backgroundColor: Colors.indigo,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextField(
                    controller: editNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: widget.user.payload.name == null
                          ? "Name"
                          : widget.user.payload.name,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: editPhoneController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: widget.user.payload.phone,
                      ),
                    )
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    width: 150,
                    height: 60,
                    child: RaisedButton(
                      onPressed: () async {
                        print('tapped');
                        if (editPhoneController.text.isEmpty &&
                            editNameController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Update Information'),
                                  content: Text('Please type information'),
                                  actions: [
                                    new FlatButton(
                                        child: const Text('OK',
                                            style: TextStyle(
                                                color: Colors.indigo)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                );
                              });
                        }
                        else {
                          var name = editNameController.text.isNotEmpty
                              ? editNameController.text
                              : "";
                          var phone = editPhoneController.text.isNotEmpty
                              ? editPhoneController.text
                              : widget.user.payload.phone;
                          var avatar = widget.user.payload.avatar;
                          print(name);
                          print(phone);
                          print(avatar);
                          http.Response response = await APIServer()
                              .updateUserInfo(name, avatar, phone);
                          print(response.body);
                          if (response.statusCode == 200) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Update Information'),
                                    content: Text('Update successful'),
                                    actions: [
                                      new FlatButton(
                                          child: const Text('OK',
                                              style: TextStyle(
                                                  color: Colors.indigo)),
                                          onPressed: () {
                                            editNameController.text = "";
                                            editPhoneController.text = "";
                                            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                                                builder: (context) => BottomNavigation(), maintainState: false));
                                          }),
                                    ],
                                  );
                                }
                            );
                          }
                          else if (response.statusCode == 400) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Update Information'),
                                    content: Text(response.body),
                                    actions: [
                                      new FlatButton(
                                          child: const Text('OK',
                                              style: TextStyle(
                                                  color: Colors.indigo)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  );
                                }
                            );
                          }
                        }
                      },
                      child: Text(
                        'SAVE', style: TextStyle(color: Colors.white),),
                      color: Colors.indigo,
                    )
                ),
                Container(
                    width: 200,
                    padding: EdgeInsets.all(20),
                    child: OutlineButton(
                      borderSide: BorderSide.none,
                      child: Text('Change password',style: TextStyle(color: Colors.indigo,decoration:TextDecoration.underline)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return new AlertDialog(
                                  titleTextStyle : TextStyle(color: Colors.indigo),
                                  // contentPadding: const EdgeInsets.all(16.0),
                                  content:Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      TextField(
                                        controller: oldPwController,
                                        autofocus: true,
                                        keyboardType: TextInputType.visiblePassword,
                                        obscureText: true,
                                        decoration: new InputDecoration(
                                            labelText: 'Old Password',
                                            hintText: 'Type old password...',
                                            labelStyle: TextStyle(color: Colors.indigo)
                                        ),
                                      ),
                                      TextField(
                                        controller: newPwController,
                                        autofocus: true,
                                        keyboardType: TextInputType.visiblePassword,
                                        obscureText: true,
                                        decoration: new InputDecoration(

                                            labelText: 'New Password',
                                            hintText: 'Type new password...',
                                            labelStyle: TextStyle(color: Colors.indigo)
                                        ),
                                      )
                                    ],
                                  ),
                                  actions: <Widget>[
                                    new FlatButton(
                                        child: const Text('CANCEL',style: TextStyle(color: Colors.indigo)),
                                        onPressed: () {
                                          editNameController.text = "";
                                          editPhoneController.text = "";
                                          Navigator.pop(context);
                                        }),
                                    new FlatButton(
                                        child: const Text('DONE',style: TextStyle(color: Colors.indigo)),
                                        onPressed: () async {
                                          if (newPwController.text.isEmpty || oldPwController.text.isEmpty){
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text('Update Information'),
                                                    content: Text('Please fill information'),
                                                    actions: [
                                                      new FlatButton(
                                                          child: const Text('OK',
                                                              style: TextStyle(
                                                                  color: Colors.indigo)),
                                                          onPressed: () {
                                                            Navigator.of(context).pop();
                                                          }),
                                                    ],
                                                  );
                                                });
                                          }
                                          else {
                                            http.Response response = await APIServer().changePw(widget.user.payload.id, oldPwController.text, newPwController.text);
                                            if (response.statusCode == 200){
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text('Change Password'),
                                                      content: Text('Your password has been changed'),
                                                      actions: [
                                                        new FlatButton(
                                                            child: const Text('OK',
                                                                style: TextStyle(
                                                                    color: Colors.indigo)),
                                                            onPressed: () {
                                                              oldPwController.text = "";
                                                              newPwController.text = "";
                                                              Navigator.of(context).pop();
                                                            }),
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
                                                      title: Text('Change Password'),
                                                      content: Text(response.body),
                                                      actions: [
                                                        new FlatButton(
                                                            child: const Text('Try again',
                                                                style: TextStyle(
                                                                    color: Colors.indigo)),
                                                            onPressed: () {
                                                              editNameController.text = "";
                                                              editPhoneController.text = "";
                                                              Navigator.of(context).pop();
                                                            }),
                                                      ],
                                                    );
                                                  }
                                              );
                                            }
                                          }

                                        }),
                                  ]
                              );
                            }
                        );
                      },
                    )
                )
              ],
            )
        )
    );
  }

}