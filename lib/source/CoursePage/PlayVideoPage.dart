import 'dart:async';

import 'package:finalproject_1712061/API/APIServer.dart';
import 'package:finalproject_1712061/Model/CourseWithLesson.dart';
import 'package:finalproject_1712061/Model/LessonVideo.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video',
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
  bool isLoaded = false;
  void _fetchData() async{
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
    _fetchData();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = isLoaded == false ? new Stack(
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
    ) : new Container();
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
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
                          if (snapshot.connectionState == ConnectionState.done) {
                            return AspectRatio(
                              aspectRatio: 16/9,
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

                  ],
                ),
              )
          ),
          Align(
              child: loadingIndicator,
              alignment: FractionalOffset.center
          )
        ],
      ),
      floatingActionButton: lessonVideo == null ? FloatingActionButton(): FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {

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