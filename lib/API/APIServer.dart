import 'dart:convert';
import 'package:finalproject_1712061/Model/Category.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/FavoriteCourse.dart';
import 'package:finalproject_1712061/Model/Instructor.dart';
import 'package:finalproject_1712061/Model/InstructorDetail.dart';
import 'package:finalproject_1712061/Model/Courses.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:finalproject_1712061/Model/UserCourse.dart';
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



  Future<List<Instructor>> fetchInstructors()  async {
    var response = await http.get(api_server + "/instructor");
  //  print("fetchInstructor : " + response.body);
    List<Instructor> instructors = (json.decode(response.body)['payload'] as List).map((data) => Instructor.fromJson(data)).toList();
    return instructors;
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

  Future<List<Courses>> fetchNewCourses(int limit, int page) async{
    Map<String, String> body = {
      'limit': limit.toString(),
      'page': page.toString()
    };
    var response = await http.post(api_server +"/course/top-new",body: body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }
  Future<List<Courses>> fetchTopRateCourses(int limit, int page) async {
    var response = await http.post(api_server + "/course/top-rate", body: {'limit':limit.toString(),'page':page.toString()});
   // print("fetchTopRateCourses : " + response.body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }

  Future<List<Courses>> fetchTopSellCourses(int limit, int page) async {
    var response = await http.post(api_server + "/course/top-sell", body: {'limit':limit.toString(),'page':page.toString()});
   // print("fetchTopRateCourses : " + response.body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }
  Future<List<FavoriteCourse>> fetchFavoriteCourse() async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server +"/user/get-favorite-courses",headers: {"Authorization": "Bearer $token"});
  //  print("favorite: " + response.body);
  //  print(jsonDecode(response.body)['payload']);
    List<FavoriteCourse> favoriteCourses = (jsonDecode(response.body)['payload'] as List).map((data) => FavoriteCourse.fromJson(data)).toList();
    print(favoriteCourses);
    return favoriteCourses;
  }


  Future<List<UserCourse>> fetchUserCourse() async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server +"/user/get-process-courses",headers: {"Authorization": "Bearer $token"});
  //  print("fetch User Course: " + response.body);
    List<UserCourse> courses = (json.decode(response.body)['payload'] as List).map((data) => UserCourse.fromJson(data)).toList();
    return courses;

  }


  Future<CourseInfo> getCourseInfo(String id,String userId) async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    final response = await http.get(api_server + "/course/get-course-detail/${id}/${userId}");
    print(response.body);
    if (response.statusCode == 200){
      CourseInfo course = CourseInfo.fromJson(json.decode(response.body)['payload']);
      return course;
    }
    else {
      return null;
    }
  }


  Future<CourseWithLesson> getCourseWithLession(String courseId) async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    print("token" + token);
    final response = await http.get(api_server + "/course/detail-with-lesson/${courseId}/",headers: {"Authorization": "Bearer $token"});
    print(response.body);
    if (response.statusCode == 200){
      CourseWithLesson course = CourseWithLesson.fromJson(json.decode(response.body)['payload']);
      return course;
    }
    else {
      return null;
    }
  }

  Future getUserCourse(String id) async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server + "/course/process-course/${id}",headers: {"Authorization": "Bearer $token"});
   // print(response.body);
    return response;
  }



  Future<Category> getCategory()async{
    final response = await http.get(api_server+"/category/all");
    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    }
   return null;
  }


// pt post
  Future getUserLikeCourse(String courseId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.post(api_server + "/user/like-course",body: {"courseId": courseId},headers: {"Authorization": "Bearer $token"});
    print(response.body);
    return response;
  }

  Future getJoinCourse(String courseId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.post(api_server + "/payment/get-free-courses",body: {"courseId": courseId},headers: {"Authorization": "Bearer $token"});
    print(response.body);
    return response;
  }



  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }


}