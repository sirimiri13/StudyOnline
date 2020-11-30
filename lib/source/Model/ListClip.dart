import 'package:flutter/material.dart';
import 'Clip.dart';

class ListClip extends ChangeNotifier{
  final List<Clip> listClip =[
    Clip("Chapter 1","Assets/images/code8.jpg","2"),
    Clip("Chapter 2","Assets/images/code7.jpg","1"),
    Clip("Chapter 3","Assets/images/code2.jpg","1"),
    Clip("Chapter 4","Assets/images/code1.jpg","1"),
    Clip("Chapter 5","Assets/images/code4.jpg","1"),
    Clip("Chapter 6","Assets/images/code5.jpg","1"),
  ];
  List<Clip> get list => listClip;

}
