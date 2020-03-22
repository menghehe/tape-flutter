
import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/clip.dart';

class ClipApi{
  static postClip(File video,Clip clip) async {
    FormData formData = FormData.fromMap({
      "title":clip.title,
      "video": await MultipartFile.fromFile(video.path)
    });
    return HttpManager.getInstance().post("/api/clip/new", formData);
  }

  static getRecommend() async {
    return HttpManager.getInstance().get("/api/clip/recommend", null);
  }

  static getClip(Clip clip) async {
    return HttpManager.getInstance().get("/api/clip/get", JsonMapper.toMap(clip,SerializationOptions(ignoreNullMembers: true)));
  }
}