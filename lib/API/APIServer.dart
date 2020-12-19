import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant-server.dart';


class APIServer{

  Future login (String email, String password) async{
    Map data = {
      'email': email,
      'password': password
    };
    var response = await http.post(api_server + "/user/login",body: data);
    var jsData = jsonDecode(response.body);

    if(response.statusCode == 200){
      print('data : ${jsData["token"]}');
      _save(jsData["token"]);
    }
    return response;
  }
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  Future register(String username, String email, String phone, String password) async{
    Map data = {
      'username': username,
      'email': email,
      'phone': phone,
      'password': password
    };
    var response = await http.post(api_server + "/user/register",body: data);
    return response;
  }

  Future forgetPassword(String email) async {
    Map data = {
      'email': email
    };
    var response = await http.post(api_server + "/user/forget-pass/send-email",body: data);
    return response;
  }


  Future<List> getUserInfo() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$api_server/user/me";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    return json.decode(response.body);
  }


  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


}