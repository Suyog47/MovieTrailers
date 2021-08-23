import 'package:flutter/material.dart';

class Navigate{

  void toHome(context, [Map? data]){
    Navigator.pushReplacementNamed(context, "/home", arguments: data);
  }

  void toInformation(context, [Map? data]){
    Navigator.pushNamed(context, "/information", arguments: data);
  }

  void toVideo(context, [Map? data]){
    Navigator.pushNamed(context, "/video", arguments: data);
  }

}