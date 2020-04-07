import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tape/api/request/Address.dart';
import 'package:tape/models/clip.dart';
import 'package:tape/models/comment.dart';
import 'package:tape/models/user.dart';
import 'package:video_player/video_player.dart';

class PlayerState implements Cloneable<PlayerState>{

  Clip clip;
  int clipId;
  VideoPlayerController videoPlayerController;
  ScrollController scrollController = ScrollController();
  List<Comment> commentList = List();
  TextEditingController commentEditController = TextEditingController();

  @override
  PlayerState clone() {
    return PlayerState()
        ..videoPlayerController = videoPlayerController
        ..clip = clip
        ..clipId = clipId
        ..commentEditController = commentEditController
        ..commentList = commentList;
  }

}

PlayerState initState(Map<String, dynamic> args) {
  Clip clip = args['clip'];
  int clipId;
  VideoPlayerController videoPlayerController;
  if(args['clipId']!=null){
    clipId = args['clipId'];
    clip = null;
  }else{
    videoPlayerController = VideoPlayerController.network(Address.BASE_CLIP_URL+ clip.clipPath);
  }
  return PlayerState()
      ..clip = clip
      ..clipId = clipId
      .. videoPlayerController=videoPlayerController ;

}
