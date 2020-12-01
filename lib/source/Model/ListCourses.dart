import 'package:flutter/material.dart';
import 'Course.dart';
import 'ListClip.dart';

class ListCourses extends ChangeNotifier{
  final List<Course> _listCourses = [
    Course(id: "C0001",
        title: "Lập trình Android toàn tập",
        subtitle: "Hướng dẫn Reactjs, React Router 4, Animations, Authentication, BDD và nhiều hơn nữa!",
        price: 249000,
        description: "Lập trình Android không khó, vì khóa học này sẽ hướng dẫn bạn chi tiết về lập trình Android, cung cấp thủ thuật về ASO giúp bạn tăng thu nhập với lập trình Android.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng Android, game Android",
          "Biết cách upload ứng dụng Android lên Google Play",
          "Kiếm tiền từ các ứng dụng trên Google Play",
          "ASO - tối ưu ứng dụng lên TOP tìm kiếm từ khoá"
        ],
        soldNumber: 5,
        ratedNumber: 5,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/android.jpg",
        promoVidUrl: "Assets/images/android.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,04,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0001",
        categoryIds: [
          "C0001"
        ],
        downloaded: false,
    ),
    Course(id: "C0002",
        title: "Swift",
        subtitle: "Giới thiệu tổng quan về ngôn ngữ Swift",
        price: 249000,
        description: "Lập trình iOS không khó.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng iOS , game iOS ",
        ],
        soldNumber: 5,
        ratedNumber: 6,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/swift.jpg",
        promoVidUrl: "Assets/images/swift.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,01,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0002",
        categoryIds: [
          "C0002"
        ],
      downloaded: false,),
    Course(id: "C0003",
        title: "SQL Toturial",
        subtitle: "Giới thiệu tổng quan về SQL ",
        price: 249000,
        description: "cung cấp các kiến thức cơ bản về SQL ",
        requirement: [
          "có kiến thức lập trình"
        ],
        learnWhat: [
          "Các syntax cơ bản của SQL",
          "Các thao tác cơ bản của SQL",
        ],
        soldNumber: 5,
        ratedNumber: 4,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/sql.png",
        promoVidUrl: "Assets/images/sql.png",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,03,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0003",
        categoryIds: [
          "C0003"
        ],
      downloaded: false,),
    Course(id: "C0004",
        title: "DeepLearning ",
        subtitle: "DeepLearning",
        price: 1000000,
        description: "Lập trình Deep Learning không khó",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Khái niệm cơ bản về DeepLearning",
          "Ứng dụng DeepLearning vào thực tế"
        ],
        soldNumber: 5,
        ratedNumber: 8,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/deeplearning.jpg",
        promoVidUrl: "Assets/images/deeplearning.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,06,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0004",
        categoryIds: [
          "C0004"
        ],
      downloaded: false,),
    Course(id: "C0005",
        title: "PHP Basic ",
        subtitle: "Giới thiệu tổng quát PHP",
        price: 300000,
        description: "Lập trình PHP không khó",
        requirement: [
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Các hàm cơ bản trong PHP",
        ],
        soldNumber: 5,
        ratedNumber: 7,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/php.jpg",
        promoVidUrl: "Assets/images/php.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,10,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0005",
        categoryIds: [
          "C0005"
        ],
      downloaded: false,),
    Course(id: "C0006",
        title: "Lập trình Python toàn tập",
        subtitle: "Hướng dẫn các syntax Python cơ bản và nhiều hơn nữa!",
        price: 500000,
        description: "Lập trình Python không khó, vì khóa học này cung cấp thủ thuật về  lập trình Python.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Biết rõ về Python",
          "Áp dụng vào Thị giác máy tính"
        ],
        soldNumber: 5,
        ratedNumber: 7,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/python.jpg",
        promoVidUrl: "Assets/images/python.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,11,21),
        updatedAt: new DateTime(2020,11,21),
        instructorId: "C0006",
        categoryIds: [
          "C0006"
        ],
      downloaded: false,),
  ];


  final List<Course> listCourseML = [
    Course(id: "C0004",
        title: "DeepLearning ",
        subtitle: "DeepLearning",
        price: 1000000,
        description: "Lập trình Deep Learning không khó",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Khái niệm cơ bản về DeepLearning",
          "Ứng dụng DeepLearning vào thực tế"
        ],
        soldNumber: 5,
        ratedNumber: 8,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/deeplearning.jpg",
        promoVidUrl: "Assets/images/deeplearning.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,06,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0004",
        categoryIds: [
          "C0004"
        ],
      downloaded: false,),
    Course(id: "C0007",
        title: "DeepLearning Tutorial ",
        subtitle: "DeepLearning",
        price: 1000000,
        description: "Lập trình Deep Learning không khó",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Khái niệm cơ bản về DeepLearning",
          "Ứng dụng DeepLearning vào thực tế"
        ],
        soldNumber: 5,
        ratedNumber: 8,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/deeplearning.jpg",
        promoVidUrl: "Assets/images/deeplearning.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,06,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0004",
        categoryIds: [
          "C0004"
        ],
      downloaded: false,),
    Course(id: "C0008",
        title: "MachineLearning ",
        subtitle: "DeepLearning",
        price: 1000000,
        description: "Lập trình Machine Learning không khó",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Khái niệm cơ bản về DeepLearning",
          "Ứng dụng DeepLearning vào thực tế"
        ],
        soldNumber: 5,
        ratedNumber: 8,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/deeplearning.jpg",
        promoVidUrl: "Assets/images/deeplearning.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,06,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0004",
        categoryIds: [
          "C0004"
        ],
      downloaded: false,),
  ];

  List<Course> listCourseSwift =[
    Course(id: "C0002",
        title: "Swift",
        subtitle: "Giới thiệu tổng quan về ngôn ngữ Swift",
        price: 249000,
        description: "Lập trình iOS không khó.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng iOS , game iOS ",
        ],
        soldNumber: 5,
        ratedNumber: 6,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/swift.jpg",
        promoVidUrl: "Assets/images/swift.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,01,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0002",
        categoryIds: [
          "C0002"
        ],
      downloaded: false,),
    Course(id: "C0009",
        title: "Swift 5.0",
        subtitle: "Giới thiệu tổng quan về ngôn ngữ Swift",
        price: 249000,
        description: "Lập trình iOS không khó.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng iOS , game iOS ",
        ],
        soldNumber: 5,
        ratedNumber: 6,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/swift.jpg",
        promoVidUrl: "Assets/images/swift.jpg",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,01,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0002",
        categoryIds: [
          "C0002"
        ],
      downloaded: false,),
  ];
  List<Course> listCourseC = [
    Course(id: "C00010",
        title: "C++ Tutorial ",
        subtitle: "Giới thiệu tổng quan về ngôn ngữ C++",
        price: 249000,
        description: "Lập trình iOS không khó.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng iOS , game iOS ",
        ],
        soldNumber: 5,
        ratedNumber: 6,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/C.PNG",
        promoVidUrl: "Assets/images/C.PNG",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,01,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0002",
        categoryIds: [
          "C0002"
        ],
      downloaded: false,),
    Course(id: "C00011",
        title: "C++ Tutorial 2020 ",
        subtitle: "Giới thiệu tổng quan về ngôn ngữ C++",
        price: 249000,
        description: "Lập trình iOS không khó.",
        requirement: [
          "thông minh",
          "đã biết lập trình cơ bản"
        ],
        learnWhat: [
          "Tự tin phát triển những ứng dụng iOS , game iOS ",
        ],
        soldNumber: 5,
        ratedNumber: 6,
        videoNumber: 5,
        totalHours: 5,
        formalityPoint: 5,
        contentPoint: 5,
        presentationPoint: 5,
        imageUrl: "Assets/images/C.PNG",
        promoVidUrl: "Assets/images/C.PNG",
        status: "PENDING",
        isDeleted: true,
        isHidden: true,
        createdAt: new DateTime(2020,01,21),
        updatedAt: new DateTime(2020,04,21),
        instructorId: "C0002",
        categoryIds: [
          "C0002"
        ],
      downloaded: false,),

  ];

  final List<Course> myCourses = [
    Course(id: "C0012",
      title: "Tìm hiểu về Firebase",
      subtitle: "Firebase",
      price: 249000,
      description: "Tìm hiểu về Firebase",
      requirement: [
        "thông minh",
        "đã biết lập trình cơ bản"
      ],
      learnWhat: [
       "Các thao tác cơ bản trên Firebase"
      ],
      soldNumber: 5,
      ratedNumber: 5,
      videoNumber: 5,
      totalHours: 5,
      formalityPoint: 5,
      contentPoint: 5,
      presentationPoint: 5,
      imageUrl: "Assets/images/firebase.png",
      promoVidUrl: "Assets/images/firebase.png",
      status: "PENDING",
      isDeleted: true,
      isHidden: true,
      createdAt: new DateTime(2020,04,21),
      updatedAt: new DateTime(2020,04,21),
      instructorId: "C0012",
      categoryIds: [
        "C0012"
      ],
      downloaded: false,
    ),
    Course(id: "C0013",
      title: "Flutter Tutorial",
      subtitle: "Giới thiệu tổng quan FLutter",
      price: 249000,
      description: "Lập trình Flutter không khó.",
      requirement: [
        "thông minh",
        "đã biết lập trình cơ bản"
      ],
      learnWhat: [
        "Tự tin phát triển những ứng dụng trên cả andoroid và iOS ",
      ],
      soldNumber: 5,
      ratedNumber: 6,
      videoNumber: 5,
      totalHours: 5,
      formalityPoint: 5,
      contentPoint: 5,
      presentationPoint: 5,
      imageUrl: "Assets/images/flutter.jpg",
      promoVidUrl: "Assets/images/flutter.jpg",
      status: "PENDING",
      isDeleted: true,
      isHidden: true,
      createdAt: new DateTime(2020,01,21),
      updatedAt: new DateTime(2020,04,21),
      instructorId: "C0002",
      categoryIds: [
        "C0002"
      ],
      downloaded: false,),

  ];
  List<Course> get listCourse => _listCourses;

  List<Course> getListCourseRate(){
    List<Course> listCourseRate = new List<Course>();
    listCourse.sort((a,b)=>a.ratedNumber.compareTo(b.ratedNumber));
    for (int i=listCourse.length-1;i>=0;i--){
      //print(listCourse[i].ratedNumber);
      listCourseRate.add(listCourse[i]);
    }
    return listCourseRate;
  }
  final List<Course> listCourseDownloaded = [];

  List<String> getTitle(){
    List<String> listTitle = [];
    for (int i = 0;i<listCourse.length;i++){
      listTitle.add(listCourse[i].title);
    }
    return listTitle;
  }
  void addCourse(List<Course>lCourse,Course newCourse){
    lCourse.add(newCourse);
    notifyListeners();
  }
  void removeCourse(List<Course> lCourse, Course course){
    lCourse.remove(course);
    notifyListeners();
  }

}

