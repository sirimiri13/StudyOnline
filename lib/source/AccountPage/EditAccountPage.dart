import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/User.dart';


TextEditingController editNameController = new TextEditingController();
TextEditingController editEmailController = new TextEditingController();
TextEditingController editPhoneController = new TextEditingController();

class EditAccountPage extends StatefulWidget{
  static String tag = 'edit-account-page';
  @override
  _EditAccountPage createState() => new _EditAccountPage();
}

class _EditAccountPage extends State<EditAccountPage>{
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
        title: Text('EDIT'),
        backgroundColor: Colors.indigo,
      ),
        body: Center(
         child: Consumer<User>(
          builder: (context, user, child)=> Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10.0,right: 10.0),
              child:TextField(
                controller: editNameController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: user.name,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: TextField(
                controller: editEmailController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: user.email,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: editPhoneController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: user.phone,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 150,
              height: 60,
              child: RaisedButton(
                onPressed: () => {
                  if (editNameController.text.isNotEmpty)
                    user.editName(editNameController.text),
                  if (editEmailController.text.isNotEmpty)
                    user.editEmail(editEmailController.text),
                  if (editPhoneController.text.isNotEmpty)
                    user.editPhone(editPhoneController.text),
                  editNameController.clear(),
                  editEmailController.clear(),
                  editPhoneController.clear(),
                  Navigator.pop(context),
                  print(user.name),
                },
                child: Text('SAVE',style: TextStyle(color: Colors.white),),
                color: Colors.indigo,
              )
            )
          ],
        )
      )
      ),
        );
  }

}