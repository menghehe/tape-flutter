import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/global_store/state.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/user.dart';
import 'package:video_player/video_player.dart';

class PlayerState implements Cloneable<PlayerState>,GlobalBaseState {

  Clip clip;
  VideoPlayerController videoPlayerController;
  ScrollController scrollController = ScrollController();
  List<Comment> commentList = List();
  TextEditingController commentEditController = TextEditingController();

  @override
  PlayerState clone() {
    return PlayerState()
        ..themeData = themeData
        ..videoPlayerController = videoPlayerController
        ..user = user
        ..clip = clip
      ..commentEditController = commentEditController
        ..commentList = commentList;
  }

  @override
  Color themeColor;

  @override
  ThemeData themeData;

  @override
  User user;
}

PlayerState initState(Map<String, dynamic> args) {
  Clip clip = args['clip'];
  VideoPlayerController videoPlayerController;
  if(args['vc']==null){
     videoPlayerController = VideoPlayerController.network(clip.clipPath);
  }else{
     videoPlayerController = args['vc'];
  }
  return PlayerState()
      ..clip = clip
      .. videoPlayerController=videoPlayerController ;
}
