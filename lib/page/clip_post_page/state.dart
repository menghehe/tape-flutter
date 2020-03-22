import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClipPostState implements Cloneable<ClipPostState> {


  @override
  ClipPostState clone() {
    return ClipPostState();
  }

  File video;
  ChewieController chewieController;
  TextEditingController titleEditingController = TextEditingController();

}

ClipPostState initState(Map<String, dynamic> args) {
  VideoPlayerController videoPlayerController = VideoPlayerController.file(args["video"]);
  return ClipPostState()
      ..video = args["video"]
      ..chewieController =  ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightGreen,
        ),
        placeholder: Container(
          color: Colors.grey,
        ),
      );
}
