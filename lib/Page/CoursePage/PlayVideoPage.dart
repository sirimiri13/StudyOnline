import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/LessonVideo.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Video",
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  String courseId;
  Lesson lesson;
  VideoPlayerScreen({Key key,this.courseId,this.lesson}): super(key: key);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  LessonVideo lessonVideo;
  final Dio dio = Dio();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  String progressDownloading = "";


  bool isLoaded = false;
  bool _isDownloading = false;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _fetchData() async {
    setState(() {
      isLoaded = false;
    });
    lessonVideo = await APIServer().fetchLessonVideo(widget.courseId, widget.lesson.id);
    _controller = VideoPlayerController.network(lessonVideo.videoUrl);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android, iOS);

    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: _onSelectNotification);

    _fetchData();

    super.initState();
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> _requestPermissions() async {
    var permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }


  Future<void> _download() async {
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();

    if (isPermissionStatusGranted) {
      setState(() {
        _isDownloading = true;
      });
      final savePath = path.join(dir.path, widget.lesson.name + ".mov");
      await _startDownload(savePath);
      setState(() {
        _isDownloading = false;
      });
    }
    else {
      print("User declined permission!");
    }
  }


  Future<void> _startDownload(String savePath) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await dio.download(
          lessonVideo.videoUrl,
          savePath,
          onReceiveProgress: _onReceiveProgress
      );
      result['isSuccess'] = response.statusCode == 200;
      print(result['isSuccess'] ? 'true' : 'false');
      result['filePath'] = savePath;
    }
    catch (ex) {
      result['error'] = ex.toString();
    }
    finally {
      await _showNotification(result);
    }
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      setState(() {
        progressDownloading = (received / total * 100).toStringAsFixed(0) + "%";
      });
    }
  }

  Future<void> _onSelectNotification(String json) async {
    final obj = jsonDecode(json);

    if (obj['isSuccess']) {
      OpenFile.open(obj['filePath']);
    }
    else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('${obj['error']}'),
        ),
      );
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        priority: Priority.High,
        importance: Importance.Max
    );
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android, iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
        1, // notification id
        'Notification',// ,
        isSuccess ? 'Downloaded Successfull' : 'Download Failed',
        platform,
        payload: json
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = isLoaded ? new Container() : new Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.2),
        ),
        Align(
          child: Container(
            color: Colors.grey[700],
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

    Widget downloadingIndicator = _isDownloading ? new Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.2),
        ),
        Align(
          child: Container(
            color: Colors.white70,
            width: 200,
            height: 120,
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Center(
                        child: new CircularProgressIndicator()
                    )
                ),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        progressDownloading,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.indigo,
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
          alignment: FractionalOffset.center,
        )
      ],
    ) : new Container();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.lesson.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: <Widget>[
          lessonVideo == null ? Container() : Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: FutureBuilder(
                        future: _initializeVideoPlayerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Container(
                                child: VideoPlayer(_controller),
                              ),
                            );
                          }
                          else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        widget.lesson.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:Colors.indigo
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text("Hours:   ${lessonVideo.currentTime == null ? 0:lessonVideo.currentTime} / ${widget.lesson.hours}"),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        onPressed: _download,
                        color: Colors.indigo,
                        child: Text('Download Video',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),

                  ],
                ),
              )
          ),
          Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center
          ),
          Align(
              child: downloadingIndicator,
              alignment: FractionalOffset.center
          )
        ],
      ),
      floatingActionButton: lessonVideo == null
          ? FloatingActionButton()
          : FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            }
            else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}