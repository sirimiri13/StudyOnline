import 'dart:convert';
import 'dart:io';
import 'package:finalproject_1712061/source/Model/Course.dart';
import 'package:finalproject_1712061/source/Model/Instructor.dart';
import 'package:finalproject_1712061/source/Model/User.dart';
import 'package:flutter/material.dart';
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
      final prefs = await SharedPreferences.getInstance();
      print('data : ${jsData["token"]}');
      // await storage.write(key: "token",value: jsData["token"]);
      // var takeToke = storage.read(key: "token");
      // print(takeToke);
      save(jsData["token"]);

    }
    return response;
  }


  save(String token) async {
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

  Future<UserMe> fetchUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    print(token); //TODO
    final response = await http.get(api_server + "/user/me"
        ,headers: {"Authorization": "Bearer $token"}
    );
    if (response.statusCode == 200){
      final responseJson = jsonDecode(response.body);
      print(response.body + " ---- ");
      UserMe  userMe = new UserMe.fromJson(responseJson);
      return userMe;
    }
    else {
      UserMe userMe = new UserMe();
      return userMe;
    }

  }
  
  
 Future getNewCourse(int limit, int page) async{
   var response = await http.post(api_server + "/course/top_new",body: {'limit':limit,'page':page});
   return response;
 }


  
  Future<Instructor> getInstructor()  async{
    var response = await http.get(api_server + "/instructor");
    return Instructor.fromJson(jsonDecode(response.body));
  }
  
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


}