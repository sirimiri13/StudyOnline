import 'package:flutter/material.dart';


class Clip{
  String clipID;
  String clipName;
  String clipDescription;
  Clip(this.clipID,this.clipDescription,this.clipName);



  void createClip(String _clipID, String _clipName, String _clipDescription){
    this.clipID = _clipID;
    this.clipName = _clipName;
    this.clipDescription = _clipDescription;
  }

}


