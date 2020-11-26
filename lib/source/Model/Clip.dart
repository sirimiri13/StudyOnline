import 'package:flutter/material.dart';


class Clip{
 // String clipID;
  String clipName;
  String clipDescription;
  String clipImage;
  Clip(this.clipName,this.clipDescription,this.clipImage);

}
Clip createClip(String _clipName, String _clipDescription,String _clipImage){
  var newClip = new Clip(_clipName,_clipDescription,_clipImage);
  // newClip.clipName = _clipName;
  // newClip.clipDescription = _clipDescription;
  // newClip.clipImage = _clipImage;
  return newClip;
}
//
// void addClip(List<Clip> _clip,Clip newClip){
//   _clip.add(newClip);
// }

