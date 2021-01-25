import 'dart:convert';
import 'package:finalproject_1712061/Model/Category.dart';
import 'package:finalproject_1712061/Model/CourseInfo.dart';
import 'package:finalproject_1712061/Model/CourseSearch.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/Exercise.dart';
import 'package:finalproject_1712061/Model/FavoriteCourse.dart';
import 'package:finalproject_1712061/Model/Instructor.dart';
import 'package:finalproject_1712061/Model/Courses.dart';
import 'package:finalproject_1712061/Model/User.dart';
import 'package:finalproject_1712061/Model/UserCourse.dart';
import 'package:finalproject_1712061/Model/LessonVideo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant-server.dart';

class APIServer{
  // Login
  Future login (String email, String password) async{
    Map data = {
      'email': email,
      'password': password
    };
    var response = await http.post(api_server + "/user/login",body: data);
    var jsData = jsonDecode(response.body);

    if(response.statusCode == 200){
      final prefs = await SharedPreferences.getInstance();
      save(jsData["token"]);
    }
    return response;
  }

  // Register
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

  // Forget Password
  Future forgetPassword(String email) async {
    Map data = {
      'email': email
    };
    var response = await http.post(api_server + "/user/forget-pass/send-email",body: data);
    return response;
  }

  // save Token
  save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  // fetch current user's Info
  Future<UserMe> fetchUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    print(token); //TODO
    final response = await http.get(api_server + "/user/me"
        ,headers: {"Authorization": "Bearer $token"}
    );
    if (response.statusCode == 200){
      final responseJson = jsonDecode(response.body);
      UserMe  userMe = new UserMe.fromJson(responseJson);
      return userMe;
    }
    else {
      UserMe userMe = new UserMe();
      return userMe;
    }

  }

  // update user's info

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

// change password
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


// fetch danh sách giáo viên
  Future<List<Instructor>> fetchInstructors()  async {
    var response = await http.get(api_server + "/instructor");
    List<Instructor> instructors = (json.decode(response.body)['payload'] as List).map((data) => Instructor.fromJson(data)).toList();
    return instructors;
  }


// fetch khoá học mới
  Future<List<Courses>> fetchNewCourses(int limit, int page) async{
    Map<String, String> body = {
      'limit': limit.toString(),
      'page': page.toString()
    };
    var response = await http.post(api_server +"/course/top-new",body: body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }

  // fetch khoá học top rating
  Future<List<Courses>> fetchTopRateCourses(int limit, int page) async {
    var response = await http.post(api_server + "/course/top-rate", body: {'limit':limit.toString(),'page':page.toString()});
   // print("fetchTopRateCourses : " + response.body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }

  // fetch khoá học bán được nhiều nhất
  Future<List<Courses>> fetchTopSellCourses(int limit, int page) async {
    var response = await http.post(api_server + "/course/top-sell", body: {'limit':limit.toString(),'page':page.toString()});
   // print("fetchTopRateCourses : " + response.body);
    List<Courses> courses = (json.decode(response.body)['payload'] as List).map((data) => Courses.fromJson(data)).toList();
    return courses;
  }

  // fetch khoá học current user đã yêu thích
  Future<List<FavoriteCourse>> fetchFavoriteCourse() async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server +"/user/get-favorite-courses",headers: {"Authorization": "Bearer $token"});
    List<FavoriteCourse> favoriteCourses = (jsonDecode(response.body)['payload'] as List).map((data) => FavoriteCourse.fromJson(data)).toList();
    print(favoriteCourses);
    return favoriteCourses;
  }

  // lấy khoá học current user yêu thích
  Future getUserLikeCourse(String courseId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.post(api_server + "/user/like-course",body: {"courseId": courseId},headers: {"Authorization": "Bearer $token"});
    print(response.body);
    return response;
  }

// fetch khoá học current user đã tham gia
  Future<List<UserCourse>> fetchUserCourse() async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server +"/user/get-process-courses",headers: {"Authorization": "Bearer $token"});
  //  print("fetch User Course: " + response.body);
    List<UserCourse> courses = (json.decode(response.body)['payload'] as List).map((data) => UserCourse.fromJson(data)).toList();
    return courses;

  }

// lấy khoá học current user tham gia
  Future getJoinCourse(String courseId) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.post(api_server + "/payment/get-free-courses",body: {"courseId": courseId},headers: {"Authorization": "Bearer $token"});
    print(response.body);
    return response;
  }

// fetch thông tin khoá học theo id
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



// fetch khoá học với bài học
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


  // lấy bài tập theo lesson

Future<List<Exercise>> fetchExercises(String lessonId) async{
  Map body = {
    'limit': lessonId
  };
  final prefs = await SharedPreferences.getInstance();
  String token = await prefs.get('token');
  final response = await http.post(api_server + "/exercise/student/list-exercise-lesson", headers: {"Authorization": "Bearer $token", "content-type": "application/json"}, body: json.encode(body));
  if (response.statusCode == 200) {
    List<Exercise> exercises = (json.decode(response.body)["payload"]["exercises"] as List).map((data) => Exercise.fromJson(data)).toList();
    return exercises;
  }
  return null;
}

// lấy video lesson
  Future<LessonVideo> fetchLessonVideo(String courseID, String lessonID) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    final response = await http.get(api_server + "/lesson/video/" + courseID + "/" + lessonID, headers: {"Authorization": "Bearer $token", "content-type": "application/json"});
    if (response.statusCode == 200) {
      LessonVideo lessonVideo = LessonVideo.fromJson(json.decode(response.body)['payload']);
      return lessonVideo;
    }
    return null;
  }

  Future getUserCourse(String id) async{
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    var response = await http.get(api_server + "/course/process-course/${id}",headers: {"Authorization": "Bearer $token"});
    return response;
  }


// fetch danh sách category
  Future<List<Category>> getCategory()async{
    final response = await http.get(api_server + "/category/all");
    if (response.statusCode == 200) {
      List<Category> courses = (json.decode(response.body)["payload"] as List).map((data) => Category.fromJson(data)).toList();
      return courses;
    }
    return null;
  }

  Future<Category> fetchCategory(String cateID) async {
    var response = await http.get(api_server + "/category/${cateID}");
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body)["payload"];
      Category category = new Category.fromJson(responseJson);
      return category;
    }
    else {
      return null;
    }
  }

  Future<List<SearchCourse>> fetchCourseOfCategory(String cateID) async {
    Map<String, dynamic> data = {
      "keyword": "",
      "opt": {
        "sort": {
          "attribute": "updatedAt",
          "rule": "DESC"
        },
        "category": [cateID],
        "time": null,
        "price": null
      },
      "limit": 15,
      "offset": 1
    };
    var response = await http.post(api_server + "/course/search", headers: {"content-type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      List<SearchCourse> courses = (json.decode(response.body)["payload"]["rows"] as List).map((data) => SearchCourse.fromJson(data)).toList();
      return courses;
    }
    return null;
  }

// search
  Future<List<SearchCourse>> fetchSearchCourses(String searchString) async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.get('token');
    Map<String, dynamic> data = {
      "token": token,
      "keyword": searchString,
      "limit": 10,
      "offset": 1,
      "opt": {
        "sort": {
          "attribute": "updatedAt",
          "rule": "DESC"
        },
        "category": [],
        "time": [],
        "price": []
      }
    };
    var response = await http.post(api_server + "/course/searchV2", headers: {"content-type": "application/json"}, body: json.encode(data));
    if (response.statusCode == 200) {
      List<SearchCourse> courses = (json.decode(response.body)["payload"]["courses"]["data"] as List).map((data) => SearchCourse.fromJson(data)).toList();

      return courses;
    }
    return null;
  }



}