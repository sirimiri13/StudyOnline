import 'dart:convert';
import 'package:finalproject_1712061/source/Model/Category.dart';
import 'package:finalproject_1712061/source/Model/CourseInfo.dart';
import 'package:finalproject_1712061/source/Model/Instructor.dart';
import 'package:finalproject_1712061/source/Model/InstructorDetail.dart';
import 'package:finalproject_1712061/source/Model/Courses.dart';
import 'package:finalproject_1712061/source/Model/User.dart';
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

  Future updateUserInfo(String name, String avatar, String phone) async{
    Map data = {
      'name': name,
      'avatar': avatar,
      'phone': phone,
    };
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    final response = await http.put(api_server + "/user/update-profile",headers: {"Authorization": "Bearer $token"},body:data );
    return response;
  }


  Future changePw(String id, String oldPw, String newPw) async{
    Map data = {
      'id' :id,
      'oldPass' : oldPw,
      'newPass' : newPw
    };
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    final response = await http.post(api_server + "/user/change-password", headers: {"Authorization": "Bearer $token"},body: data);
    return response;
  }



  
  Future<Instructor> getInstructor()  async{
    var response = await http.get(api_server + "/instructor");
    if (response.statusCode == 200){
      return Instructor.fromJson(jsonDecode(response.body));
    }
    else {
      print('No data');
    }
  }


  Future<InstructorDetail> getInstructorDetail(String id) async {
    var  response = await http.get(api_server + "/instructor/detail/${id}");
    if (response.statusCode == 200){
      return InstructorDetail.fromJson(jsonDecode(response.body));
    }
    else {
      print("error: ${response.body}");
    }
  }


  Future<Courses> getNewCourse(int limit, int page) async{
    Map<String, String> body = {
      'limit': limit.toString(),
      'page': page.toString()
    };
    var response = await http.post(api_server +"/course/top-new",body: body);
    print(response.body);
    return Courses.fromJson(jsonDecode(response.body));

  }


  Future<Courses> getCourseRate(int limit, int page) async{
    Map<String, String> body = {
      'limit': limit.toString(),
      'page': page.toString()
    };
    //print(body);
    var response = await http.post(api_server +"/course/top-sell",body: {'limit':limit.toString(),'page':page.toString()});
    //print(response.body);
    return Courses.fromJson(jsonDecode(response.body));
    return null;
  }


  Future<CourseInfo> getCourseInfo(String id) async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    final response = await http.get(api_server + "/course/detail-with-lesson/${id}", headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200){
      return CourseInfo.fromJson(jsonDecode(response.body));
    }

    else {
      // print(response.body);
      return null;
    }
  }



  Future<Category> getCategory()async{
    final response = await http.get(api_server+"/category/all");
    print("category: ${response.body}");

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    }
   return null;
  }
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


}