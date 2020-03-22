import 'dart:io';
import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:tape/global_store/state.dart';
import 'package:video_player/video_player.dart';

class ClipRecordState implements Cloneable<ClipRecordState>{

  @override
  ClipRecordState clone() {
    return ClipRecordState()
        ..cameraVideo = cameraVideo
        ..cameraVideoPlayerController = cameraVideoPlayerController
        ..video = video
        ..videoPlayerController = videoPlayerController
        ..chewieController = chewieController;
  }


  File video;
  File cameraVideo;
  VideoPlayerController videoPlayerController;
  VideoPlayerController cameraVideoPlayerController;
  ChewieController chewieController;

}

ClipRecordState initState(Map<String, dynamic> args) {
  return ClipRecordState();
}
