import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/clip.dart';

class ClipApi{
  static postClip(File video,Clip clip) async {
    FormData formData = FormData.fromMap({
      "title":clip.title,
      "coverTime":clip.coverTime,
      "video": await MultipartFile.fromFile(video.path)
    });
    return HttpManager.getInstance().post("/api/clip/create", formData);
  }

  static listClip(Clip clip) async {
    Map params = JsonMapper.toMap(clip,SerializationOptions(ignoreNullMembers: true));
    return HttpManager.getInstance().post("/api/clip/list", params);
  }


  static showClip(String id){
    return HttpManager.getInstance().get("/api/clip/show/"+id,null);
  }

  static hotClip(){
    return HttpManager.getInstance().get("/api/clip/hot/",null);
  }
}