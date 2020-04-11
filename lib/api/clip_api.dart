
import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:tape/api/request/HttpManager.dart';
import 'package:tape/models/base.dart';
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

  static getRecommend() async {
    OrderItem orderItem = OrderItem("create_time", false);
    List<OrderItem> orderList = List();
    orderList.add(orderItem);
    Clip clip = Clip();
    clip.orders = orderList;
    Map params = JsonMapper.toMap(clip,SerializationOptions(ignoreNullMembers: true));
    return HttpManager.getInstance().post("/api/clip/recommend", params);
  }

  static getClip(Clip clip) async {
    OrderItem orderItem = OrderItem("create_time", false);
    List<OrderItem> orderList = List();
    orderList.add(orderItem);
    clip.orders = orderList;
    return HttpManager.getInstance().get("/api/clip/get", JsonMapper.toMap(clip,SerializationOptions(ignoreNullMembers: true)));
  }

  static showClip(String id){
    return HttpManager.getInstance().get("/api/clip/show/"+id,null);
  }
}